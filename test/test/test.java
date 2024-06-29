/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

/**
 *
 * @author hc
 */


import dao.CartDao;
import model.CartItem;

import java.util.List;

public class test {
    public static void main(String[] args) {
        // Ví dụ: Lấy giỏ hàng của người dùng có id_nguoidung là 1
        int userId = 1;

        // Tạo đối tượng CartDao
        CartDao cartDao = new CartDao();

        // Gọi phương thức để lấy danh sách các sản phẩm trong giỏ hàng của người dùng có id_nguoidung là userId
        List<CartItem> cartItems = cartDao.getItemsByUserId(userId);

        // In ra danh sách các sản phẩm trong giỏ hàng
        System.out.println("Cart items for user with id_nguoidung = " + userId);
        for (CartItem item : cartItems) {
            System.out.println(item);
        }
    }
}
