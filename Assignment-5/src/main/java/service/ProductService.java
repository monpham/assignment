package service;


import entity.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.ProductsRepository;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductsRepository productsRepository;

    public List<Products> getproductsList(){
        return (List<Products>) productsRepository.findAll();
    }
    public Products getfindById(int id) {
        Products products = productsRepository.findById(id);
        return products;
    }
}
