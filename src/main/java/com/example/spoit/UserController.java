package com.example.spoit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;

@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private UserDAO userDAO;
    
    // 로그인 페이지
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }
    
    // 회원가입 페이지
    @GetMapping("/signin")
    public String signinPage() {
        return "signin";
    }
    
    // 회원탈퇴 페이지
    @GetMapping("/delete")
    public String deletePage() {
        return "deleteUser";
    }
    
    // 로그인 처리
    @PostMapping("/login")
    public String login(@RequestParam String userID, 
                       @RequestParam String userPassword, 
                       HttpSession session, 
                       Model model) {
        try {
            User user = userDAO.login(userID, userPassword);
            if (user != null) {
                session.setAttribute("user", user);
                return "redirect:/";
            } else {
                model.addAttribute("error", "아이디 또는 비밀번호가 틀렸습니다.");
                return "login";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "로그인 처리 중 오류가 발생했습니다.");
            return "login";
        }
    }
    
    // 회원가입 처리
    @PostMapping("/signin")
    public String signin(User user, Model model) {
        try {
            userDAO.signIn(user);
            model.addAttribute("success", "회원가입이 정상적으로 완료되었습니다.");
            return "signin";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "회원가입이 정상적으로 진행되지 않았습니다.");
            return "signin";
        }
    }
    
    // 회원탈퇴 처리
    @PostMapping("/delete")
    public String delete(@RequestParam String userID, 
                        @RequestParam String password, 
                        Model model) {
        try {
            User user = userDAO.login(userID, password);
            if (user != null) {
                userDAO.delUser(userID);
                return "redirect:/user/login";
            } else {
                model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
                return "deleteUser";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "회원 삭제 중 오류가 발생했습니다.");
            return "deleteUser";
        }
    }
    
    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
