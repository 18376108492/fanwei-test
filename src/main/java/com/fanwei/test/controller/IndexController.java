package com.fanwei.test.controller;

import com.fanwei.test.pojo.Item;
import com.fanwei.test.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private ItemService itemService;

    /**
     * 跳转至商品选择页面
     * @return
     */
    @RequestMapping("/")
    public ModelAndView toChoose(){
     ModelAndView view=new ModelAndView();
     List<Item> items=itemService.getAllItems();
      view.addObject("items",items);
      view.setViewName("choose");
      return view;
    }
}
