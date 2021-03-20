package controller;


import cart.CartEntity;
import entity.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.ProductService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;


    @RequestMapping(value = "/")
    public String getListProducts(Model model) {
        List<Products> productsList = productService.getproductsList();
        model.addAttribute("productsList", productsList);
        return "ProductsList";
    }
}
