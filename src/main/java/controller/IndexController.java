package controller;

import com.example.spoit.Game;
import com.example.spoit.GameDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Controller
public class IndexController {
	@Autowired
	private GameDAO gameDAO;

	@GetMapping("/")
	public String rootToMain() {
		return "main";
	}

	@GetMapping("/main")
	public String mainPage() {
		return "main";
	}
}
