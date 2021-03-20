package service;

import entity.Orders;
import entity.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.OrderRepository;


import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public List<Orders> getOrdersList(){
        return (List<Orders>) orderRepository.findAll();
    }
    public Orders newTransaction(Orders orders) {
        return orderRepository.save(orders);
    }
}
