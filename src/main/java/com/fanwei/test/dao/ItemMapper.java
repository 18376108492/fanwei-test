package com.fanwei.test.dao;

import com.fanwei.test.pojo.Item;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemMapper {

    /**
     * 获取所有的商品信息操作
     * @return
     */
    List<Item> getAllItems();


}
