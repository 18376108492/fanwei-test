package com.fanwei.test.service;

import com.fanwei.test.dao.ItemMapper;
import com.fanwei.test.pojo.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService {

    @Autowired
    private ItemMapper itemMapper;
    /**
     * 获取所有的商品信息操作
     * @return
     */
  public    List<Item> getAllItems(){
       return itemMapper.getAllItems();
    }
}
