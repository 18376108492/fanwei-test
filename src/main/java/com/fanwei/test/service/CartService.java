package com.fanwei.test.service;

import com.fanwei.test.pojo.Cart;
import com.fanwei.test.pojo.Item;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartService {

    private static  List<Cart> carts=new ArrayList<>();




    public Cart getAllCart(){
        if(carts==null){
            return new Cart();
        }
       return carts.get(0);
    }

    public void delete(Integer id){
        List<Item> cart = carts.get(0).getCart();
        for (int i = 0; i <cart.size() ; i++) {
           if(cart.get(i).getId().equals(id)){
               cart.remove(i);
           }
        }
    }

    public void add(List<Item> data){
        Cart cart=new Cart();
        cart.setCid((int)(Math.random()*100));
        cart.setCart(data);
        System.out.println("cart"+cart.toString());
       // cartMapper.addCart(cart);
        carts.add(cart);
    }
}
