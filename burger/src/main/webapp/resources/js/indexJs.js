'use strict';

$(function(){
    let idxMenuOrder = $(".header-inner").children().eq(0).children();
    let idxMenuBurger = $(".header-inner").children().eq(1).children();
    let idxMenuLogin = $(".header-inner").children().eq(3).children();
    let idxMenuJoin = $(".header-inner").children().eq(4).children();
    
    $(".logo").click(function(){
    	self.location= "/burger";
    })
    
    $(idxMenuOrder).hover(function(){
        idxMenuOrder.text("주문하기");
    }, function(){
        idxMenuOrder.text("ORDER");
    });
    $(idxMenuBurger).hover(function(){
        idxMenuBurger.text("버거&음료");
    }, function(){
        idxMenuBurger.text("BUGER&DRINK");
    });
    $(idxMenuLogin).hover(function(){
        idxMenuLogin.text("로그인");
    }, function(){
        idxMenuLogin.text("LOGIN");
    });
    $(idxMenuJoin).hover(function(){
        idxMenuJoin.text("회원가입");
    }, function(){
        idxMenuJoin.text("JOIN");
    });
})