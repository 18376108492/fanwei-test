package com.fanwei.test.pojo;

import java.util.List;

/**
 * 购物车
 */
public class Cart {

    private Integer cid;//购物车编号


    private List<Item> cart;//购物车所有商品信息


    public List<Item> getCart() {
        return cart;
    }

    public void setCart(List<Item> cart) {
        this.cart = cart;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cid=" + cid +
                ", cart=" + cart +
                '}';
    }
}
