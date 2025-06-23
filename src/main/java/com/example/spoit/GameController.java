package com.example.spoit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/games")
public class GameController {
    
    @Autowired
    private GameDAO gameDAO;
    
    // 모든 경기 목록 페이지
    @GetMapping("")
    public String gameList(Model model) {
        try {
            List<Game> games = gameDAO.getAllGames();
            model.addAttribute("games", games);
            model.addAttribute("title", "전체 경기 목록");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "경기 목록을 불러오는 중 오류가 발생했습니다.");
        }
        return "gameList";
    }
    
    // 스포츠 종목별 경기 목록
    @GetMapping("/sport")
    public String gamesBySport(@RequestParam String type, Model model) {
        try {
            // 영어 파라미터를 한글로 변환
            String sportType = "";
            String sportName = "";
            switch (type) {
                case "baseball": 
                    sportType = "야구"; 
                    sportName = "야구"; 
                    break;
                case "soccer": 
                    sportType = "축구"; 
                    sportName = "축구"; 
                    break;
                case "basketball": 
                    sportType = "농구"; 
                    sportName = "농구"; 
                    break;
                default: 
                    sportType = type; 
                    sportName = type;
            }
            
            List<Game> games = gameDAO.getGamesBySportType(sportType);
            model.addAttribute("games", games);
            model.addAttribute("sportType", type); // 영어 파라미터 유지 (UI용)
            model.addAttribute("sportName", sportName);
            model.addAttribute("title", sportName + " 경기 목록");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "경기 목록을 불러오는 중 오류가 발생했습니다.");
        }
        return "gameList";
    }
    
    // 경기 상세 페이지
    @GetMapping("/{gameId}")
    public String gameDetail(@PathVariable int gameId, Model model) {
        try {
            Game game = gameDAO.getGameById(gameId);
            if (game != null) {
                model.addAttribute("game", game);
                return "gameDetail";
            } else {
                model.addAttribute("error", "해당 경기를 찾을 수 없습니다.");
                return "redirect:/games";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "경기 정보를 불러오는 중 오류가 발생했습니다.");
            return "redirect:/games";
        }
    }
} 