package spring.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.model.Room;
import spring.model.RoomDao;

@Controller
public class ImageController {

	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	RoomDao roomDao;

	@Autowired
	HttpSession session;

	@Autowired
	ServletContext context;

	private String[] typeFilter = new String[] { "image/png", "image/jpeg", "image/gif" };

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(MultipartHttpServletRequest mRequest, Model model) throws Exception {
		String photourl = "";
		MultipartFile file = mRequest.getFile("file");
		Room room = (Room) session.getAttribute("room");
		if (file.getOriginalFilename() != "") {
			log.debug("파일 업로드 요청 수신");
			log.debug("파일 이름 = " + file.getOriginalFilename());
			log.debug("파일 크기 = " + file.getSize());

			/*
			 * String mime = Magic.getMagicMatch(file.getBytes()).getMimeType();
			 * log.debug("mime = "+mime); if(Arrays.binarySearch(typeFilter, mime) < 0) {
			 * 
			 * throw new MagicMatchNotFoundException("GIF, JPG, PNG만 업로드가 가능합니다");
			 * 
			 * }
			 */

			// 저장 위치를 외부? 내부? 어디로 잡을것인가?
			// 외부 - 링크가 불가능(외부에서 주소를 통한 접근이 불가)
			// 내부 - 링크가 가능(외부에서 주소를 통한 접근이 가능)

			String saveFolder = mRequest.getServletContext().getRealPath("/file");
			log.debug("saveFolder = " + saveFolder);
			
			long time = System.currentTimeMillis(); 

			String filename  = file.getOriginalFilename()+time;

			File target = new File(saveFolder, filename);
			file.transferTo(target);

			// 파일명에 'local:' 구분자를 넣어 기존 url과 차별을 둔다
			photourl = "local:" + file.getOriginalFilename();

			room.setPhotoUrl(photourl);
		}

		String mode = mRequest.getParameter("mode");

		if (mode != null && mode.equalsIgnoreCase("save")) { // 임시 저장
			if (photourl != "") {
				boolean result = roomDao.update(room);
			}
			return "redirect:/host/become_host2_2";

		} else {

			return "redirect:/host/become_host2_1";

		}

	}

	@RequestMapping(value = "/viewPhoto/{id}")
	public void photo(HttpServletResponse response, @PathVariable int id) throws IOException {
		String saveFolder = context.getRealPath("/file");
		log.debug("id:" + id);
		Room room = roomDao.select(id);
		log.debug("photo:" + room.getPhotoUrl());
		if (room.getPhotoUrl().startsWith("local:")) {
			String filename = room.getPhotoUrl().substring(6);
			File target = new File(saveFolder, filename);
			System.out.println(target.getAbsolutePath());
			response.setContentType(Files.probeContentType(target.toPath()));
			ServletOutputStream out = response.getOutputStream();
			FileUtils.copyFile(target, out);
			out.close();
		} else {
			response.sendRedirect(room.getPhotoUrl());
		}
	}

	// 확장자가 잘못된 경우 발생하는 예외(GIF/JPG/PNG 가 아닌 경우)
	/*
	 * @ExceptionHandler(MagicMatchNotFoundException.class) public String
	 * typeError() { return "error/typeError"; }
	 */
	@ExceptionHandler(Exception.class)
	public String otherError() {
		return "error/otherError";
	}

}
