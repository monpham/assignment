package service;

import entity.OrderDetails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.OrderDetailRepository;


import java.util.List;

@Service
public class OrderDetailService {
    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public List<OrderDetails> getOrderDetailsList(){
        return (List<OrderDetails>) orderDetailRepository.findAll();
    }

    public void newOrders(OrderDetails orderDetails) {
        orderDetailRepository.save(orderDetails);
    }
}
