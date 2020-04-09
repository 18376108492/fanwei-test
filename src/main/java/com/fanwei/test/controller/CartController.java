package com.fanwei.test.controller;

import com.fanwei.test.pojo.Cart;
import com.fanwei.test.pojo.Item;
import com.fanwei.test.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CartController {

@Autowired
private CartService cartService;

    /**
     * 跳转至购物车界面
     * @return
     */
    @RequestMapping("/cart")
    public ModelAndView toCart(){
        ModelAndView view=new ModelAndView();
        view.setViewName("ShoppingCart");
        Cart carts = cartService.getAllCart();
        view.addObject("carts",carts.getCart());
        return view;
    }

    /**
     * 添加购物车
     * @return
     */
    @RequestMapping("/addCart")
    @ResponseBody
    public String addCart(@RequestBody List<Item> data){
        System.out.println("数据"+data.toString());
        cartService.add(data);
        return "添加成功";
    }

    /**
     * 删除商品
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestBody String data){
        cartService.delete(Integer.valueOf(data));
        return "删除成功";
    }
}
