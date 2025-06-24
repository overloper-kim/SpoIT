package com.example.spoit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
public class ReservInfoController {
    @Autowired
    private ReservInfoDAO reservInfoDAO;

    // 예매 처리 (POST)
    @PostMapping("/reservations/{gameId}")
    public String reserveGame(@PathVariable int gameId, @RequestParam("seat") String seat, HttpSession session, Model model) {
        Object userObj = session.getAttribute("user");
        if (userObj == null) {
            return "redirect:/user/login";
        }
        if (seat == null || seat.isEmpty()) {
            model.addAttribute("error", "좌석을 선택해주세요.");
            return "gameDetail";
        }
        User user = (User) userObj;
        try {
            reservInfoDAO.insertReservation(user.getUserID(), gameId, seat);
            model.addAttribute("msg", "예매가 완료되었습니다.");
        } catch (SQLException e) {
            model.addAttribute("msg", "예매 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "redirect:/reservations";
    }

    // 마이페이지(예매내역)
    @GetMapping("/reservations")
    public String myReservations(HttpSession session, Model model) {
        Object userObj = session.getAttribute("user");
        if (userObj == null) {
            return "redirect:/user/login";
        }
        User user = (User) userObj;
        try {
            List<ReservInfo> list = reservInfoDAO.getReservationsByUser(user.getUserID());
            model.addAttribute("reservList", list);
        } catch (SQLException e) {
            model.addAttribute("msg", "예매내역 조회 오류: " + e.getMessage());
        }
        return "myReservations";
    }
} 