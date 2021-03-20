package controller;

import cart.CartEntity;
import entity.OrderDetails;
import entity.Orders;
import entity.Products;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.OrderDetailService;
import service.OrderService;

import service.OrderDetailService;
import service.OrderService;
import service.ProductService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;


@Controller
public class CartController {
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;

    @RequestMapping(value = "addcart/{id}", method = RequestMethod.GET)
    public String viewAdd(ModelMap mm, HttpSession session, @PathVariable("id") int id) {
        HashMap<Integer, CartEntity> cartItems = (HashMap<Integer, CartEntity>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Products products = productService.getfindById(id);
        if (products != null) {
            // Dung de tim kiem theo name
            /*    if (cartItems.containsValue(name))*/
            // Dung de tim kiem theo id
            if (cartItems.containsKey(id)) {
                CartEntity item = cartItems.get(id);
                item.setProducts(products);
                item.setQuantity(item.getQuantity() + 1);
                cartItems.put(id, item);
            } else {
                CartEntity item = new CartEntity();
                item.setProducts(products);
                item.setQuantity(1);
                cartItems.put(id, item);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "Cart";
    }

    public double totalPrice(HashMap<Integer, CartEntity> cartItems) {
        int count = 0;
        for (Map.Entry<Integer, CartEntity> list : cartItems.entrySet()) {
            count += list.getValue().getProducts().getPrice() * list.getValue().getQuantity();
        }
        return count;
    }

    @RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
    public String viewRemove(ModelMap mm, HttpSession session, @PathVariable("id") Integer id) {
        HashMap<Integer, CartEntity> cartItems = (HashMap<Integer, CartEntity>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if (cartItems.containsKey(id)) {
            cartItems.remove(id);
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "Cart";

    }


    @RequestMapping(value = "/checkoutform", method = RequestMethod.GET)
    public String addProducts(Model model, HttpSession session,
                              @ModelAttribute("OrdersDetails") OrderDetails orderDetails) {
        model.addAttribute("orders", new Orders());
        return "checkout";
    }

    @RequestMapping(value = "/Orders", method = RequestMethod.GET)
    public String viewCheckout(ModelMap mm, HttpSession session, @ModelAttribute("orders")
            Orders orders) throws NoSuchAlgorithmException {
        HashMap<Integer, CartEntity> cartItems = (HashMap<Integer, CartEntity>) session.getAttribute("myCartItems");
        Orders orders1 = orderService.newTransaction(orders);
        orders1.setOrderdate(orders.getOrderdate());
        orders1.setCustomername(orders.getCustomername());
        orders1.setCustomeraddress(orders.getCustomeraddress());
        for (Map.Entry<Integer, CartEntity> entry : cartItems.entrySet()) {
            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setOrders(orders1);
            orderDetails.setProducts(entry.getValue().getProducts());
      /*                orderDetails.setTotal(entry.getValue().getProductsEntity().getPrice());*/
            orderDetails.setQuantity(entry.getValue().getQuantity());
            orderDetailService.newOrders(orderDetails);
        }
        session.removeAttribute("myCartItems");
        session.removeAttribute("myCartNum");
        return "ProductsList";
    }

}
