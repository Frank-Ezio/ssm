package com.xiaoshu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.dao.GoodsMapper;
import com.xiaoshu.entity.Goods;
import com.xiaoshu.entity.GoodsExample;
import com.xiaoshu.entity.GoodsExample.Criteria;
import com.xiaoshu.entity.GoodsType;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class GoodsService {

	@Autowired
	JedisPool pool;

	@Autowired
	GoodsMapper goodsMapper;

	public PageInfo<Goods> findGoodsPage(Integer low, Integer high, Goods goods, int pageNum, int pageSize,String ordername, String order) {
		PageHelper.startPage(pageNum, pageSize);
//		Jedis jedis = pool.getResource();
//		String gl = jedis.get("goodsList");
//		if (low!=null||high!=null||goods.getName()!=null) {
//			if (gl!=null) {
//				jedis.del("goodsList");
//			}
//		}
		List<Goods> goodsList;
//		if (gl != null) {
//			goodsList = JSON.parseArray(gl, Goods.class);
//		} else {
			GoodsExample example = new GoodsExample();
			Criteria criteria = example.createCriteria();
			criteria.andNameLike("%" + goods.getName() + "%").andPriceBetween((long) low, (long) high);
			goodsList = goodsMapper.selectByExample(example);
//			String json = JSON.toJSONString(goodsList);
//			jedis.set("goodsList", json);
//		}
		PageInfo<Goods> pageInfo = new PageInfo<Goods>(goodsList);
		return pageInfo;
	}

	public void deleteGoods(Integer id) throws Exception {
		goodsMapper.deleteByPrimaryKey(id);
//		Jedis jedis = pool.getResource();
//		jedis.del("goodsList");
	};

	public void addGoods(Goods t) throws Exception {
		goodsMapper.insert(t);
//		Jedis jedis = pool.getResource();
//		jedis.del("goodsList");
	};

	public void updateGoods(Goods t) throws Exception {
		goodsMapper.updateByPrimaryKeySelective(t);
//		Jedis jedis = pool.getResource();
//		jedis.del("goodsList");
	}

	public List<Goods> findAll() {
		// TODO Auto-generated method stub
		return goodsMapper.selectByExample(null);
	}

	public List<GoodsType> countGoods() {
		// TODO Auto-generated method stub
		return goodsMapper.countGoods();
	};
}
