package com.xiaoshu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.activemq.command.ActiveMQQueue;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.config.util.ConfigUtil;
import com.xiaoshu.entity.Goods;
import com.xiaoshu.entity.GoodsType;
import com.xiaoshu.entity.Operation;
import com.xiaoshu.service.GoodsService;
import com.xiaoshu.service.OperationService;
import com.xiaoshu.util.StringUtil;
import com.xiaoshu.util.WriterUtil;

@Controller
@RequestMapping("goods")

public class GoodsController {
	
	
	@Scheduled(cron="*/3 * * * * ?")
	public void created(){
		System.out.println(new Date());
	}
	
	@Autowired
	private GoodsService goodsService;


	@Autowired
	JmsTemplate jmsTemplate;
	
	@Autowired
	ActiveMQQueue activeMQQueue;
	
	
	@Autowired
	private OperationService operationService;
		
	@RequestMapping("goodsIndex")
	public String index(HttpServletRequest request,Integer menuid) throws Exception{
		
		List<Operation> operationList = operationService.findOperationIdsByMenuid(menuid);
		request.setAttribute("operationList", operationList);
		return "goods";
	}

	@RequestMapping(value="goodsList",method=RequestMethod.POST)
	public void userList(@RequestParam(defaultValue="1",required=true)Integer low,@RequestParam(defaultValue="99999999",required=true)Integer high,Goods goods,HttpServletRequest request,HttpServletResponse response,String offset,String limit) throws Exception{
		try {
			Integer pageSize = StringUtil.isEmpty(limit)?ConfigUtil.getPageSize():Integer.parseInt(limit);
			Integer pageNum =  (Integer.parseInt(offset)/pageSize)+1;
			
			PageInfo<Goods> userList= goodsService.findGoodsPage(low,high,goods,pageNum,pageSize,"","");
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("total",userList.getTotal() );
			jsonObj.put("rows", userList.getList());
	        WriterUtil.write(response,jsonObj.toString());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	@RequestMapping("deleteGoods")
	public void delGoods(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				goodsService.deleteGoods(Integer.parseInt(id));
			}
			result.put("success", true);
			result.put("delNums", ids.length);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
	
	@RequestMapping("countGoods")
	public void countGoods(HttpServletRequest request,HttpServletResponse response){
		List<GoodsType> list=goodsService.countGoods();
		String json=JSON.toJSONString(list);
		WriterUtil.write(response, json);
	}
	
	
	
	
	@SuppressWarnings("resource")
	@RequestMapping("goodsOut")
	public void goodsOut(HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			List<Goods> goods=goodsService.findAll();
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			String[] title={"商品编号","商品名称","商品价格","商品详情"};
			HSSFRow row0 = sheet.createRow(0);
			for (int i = 0; i < title.length; i++) {
				row0.createCell(i).setCellValue(title[i]);
			}
			for (int i = 0; i < goods.size(); i++) {
				Goods g = goods.get(i);
				HSSFRow row = sheet.createRow(i+1);
				row.createCell(0).setCellValue(g.getId());
				row.createCell(1).setCellValue(g.getName());
				row.createCell(2).setCellValue(g.getPrice());
				row.createCell(3).setCellValue(g.getInfo());
				row.createCell(4).setCellValue(g.getTypenum());
			}
			FileOutputStream stream = new FileOutputStream(new File("d://goods.xls"));
			workbook.write(stream);
			stream.close();
			workbook.close();
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	@RequestMapping("reserveGoods")
	public void reserveUser(HttpServletRequest request,final Goods goods,HttpServletResponse response){
		Integer id=goods.getId();
		JSONObject result=new JSONObject();
		try {
			if (id != null) {   
				if(!StringUtil.isEmpty(goods.getName())){
					goodsService.updateGoods(goods);
					result.put("success", true);
				}else{
					result.put("success", true);
					result.put("errorMsg", "商品不能为空");
				}
				
			}else {   
					goodsService.addGoods(goods);
					jmsTemplate.send(activeMQQueue, new MessageCreator() {
						
						@Override
						public Message createMessage(Session session) throws JMSException {
							// TODO Auto-generated method stub
							return session.createTextMessage(goods.getName()+","+goods.getPrice());
						}
					});
					result.put("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", true);
			result.put("errorMsg", "对不起，操作失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	@RequestMapping("goodsIn")
	public void goodsIn(MultipartFile file,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			HSSFWorkbook workbook=new HSSFWorkbook(file.getInputStream());
			HSSFSheet sheet = workbook.getSheetAt(0);
			int rowNum = sheet.getLastRowNum()+1;
			List<Goods> goods =new ArrayList<>();
			for (int i = 1; i < rowNum; i++) {
				HSSFRow row = sheet.getRow(i);
				double id = row.getCell(0).getNumericCellValue();
				String name = row.getCell(1).getStringCellValue();
				double price = row.getCell(2).getNumericCellValue();
				String info = row.getCell(3).getStringCellValue();
				String typenum = row.getCell(4).getStringCellValue();
				Goods g=new Goods(null, name, (long) price, info,typenum);
				goods.add(g);
			}
			for (Goods g : goods) {
				goodsService.addGoods(g);
			}
					result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		WriterUtil.write(response, result.toString());
	}
}
