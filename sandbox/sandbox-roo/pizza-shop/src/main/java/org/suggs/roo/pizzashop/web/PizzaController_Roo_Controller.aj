// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.suggs.roo.pizzashop.web;

import java.io.UnsupportedEncodingException;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import org.suggs.roo.pizzashop.domain.Base;
import org.suggs.roo.pizzashop.domain.Pizza;
import org.suggs.roo.pizzashop.domain.Topping;

privileged aspect PizzaController_Roo_Controller {
    
    @Autowired
    private GenericConversionService PizzaController.conversionService;
    
    @RequestMapping(method = RequestMethod.POST)
    public String PizzaController.create(@Valid Pizza pizza, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("pizza", pizza);
            return "pizzas/create";
        }
        pizza.persist();
        return "redirect:/pizzas/" + encodeUrlPathSegment(pizza.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PizzaController.createForm(Model model) {
        model.addAttribute("pizza", new Pizza());
        return "pizzas/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PizzaController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("pizza", Pizza.findPizza(id));
        model.addAttribute("itemId", id);
        return "pizzas/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PizzaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("pizzas", Pizza.findPizzaEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Pizza.countPizzas() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("pizzas", Pizza.findAllPizzas());
        }
        return "pizzas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PizzaController.update(@Valid Pizza pizza, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("pizza", pizza);
            return "pizzas/update";
        }
        pizza.merge();
        return "redirect:/pizzas/" + encodeUrlPathSegment(pizza.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PizzaController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("pizza", Pizza.findPizza(id));
        return "pizzas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PizzaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Pizza.findPizza(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pizzas?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("bases")
    public Collection<Base> PizzaController.populateBases() {
        return Base.findAllBases();
    }
    
    @ModelAttribute("toppings")
    public Collection<Topping> PizzaController.populateToppings() {
        return Topping.findAllToppings();
    }
    
    Converter<Base, String> PizzaController.getBaseConverter() {
        return new Converter<Base, String>() {
            public String convert(Base base) {
                return new StringBuilder().append(base.getName()).toString();
            }
        };
    }
    
    Converter<Pizza, String> PizzaController.getPizzaConverter() {
        return new Converter<Pizza, String>() {
            public String convert(Pizza pizza) {
                return new StringBuilder().append(pizza.getName()).append(" ").append(pizza.getPrice()).toString();
            }
        };
    }
    
    Converter<Topping, String> PizzaController.getToppingConverter() {
        return new Converter<Topping, String>() {
            public String convert(Topping topping) {
                return new StringBuilder().append(topping.getName()).toString();
            }
        };
    }
    
    @PostConstruct
    void PizzaController.registerConverters() {
        conversionService.addConverter(getBaseConverter());
        conversionService.addConverter(getPizzaConverter());
        conversionService.addConverter(getToppingConverter());
    }
    
    private String PizzaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}