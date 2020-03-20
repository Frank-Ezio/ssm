package com.xiaoshu.service;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
@Service
public class MyListenner implements MessageListener{

	@Autowired
	JedisPool jedisPool;
	@Override
	public void onMessage(Message msg) {
		// TODO Auto-generated method stub
		Jedis jedis = jedisPool.getResource();
		TextMessage t=(TextMessage)msg;
		try {
			System.out.println(t.getText());
		} catch (JMSException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			String[] s = t.getText().split(",");
			jedis.set(s[0], s[1]);
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
