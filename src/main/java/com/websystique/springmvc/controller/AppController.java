package com.websystique.springmvc.controller;


import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.PagedList;
import org.springframework.social.facebook.api.Post;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.websystique.springmvc.model.FileBucket;
import com.websystique.springmvc.model.User;
import com.websystique.springmvc.model.UserDocument;
import com.websystique.springmvc.model.UserProfile;
import com.websystique.springmvc.service.UserDocumentService;
import com.websystique.springmvc.service.UserProfileService;
import com.websystique.springmvc.service.UserService;
import com.websystique.springmvc.util.FileValidator;

import com.websystique.springmvc.model.NewsConten;

import com.websystique.springmvc.service.NewsService;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class AppController {

	@Autowired
	UserService userService;
	@Autowired
	UserDocumentService userDocumentService;
	@Autowired
	UserProfileService userProfileService;
	@Autowired
	NewsService newsService;
	@Autowired
	MessageSource messageSource;

	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;

	@Autowired
	FileValidator fileValidator;
	@InitBinder("fileBucket")
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(fileValidator);
	}
/*	  private Facebook facebook;
	    private ConnectionRepository connectionRepository;

	    public AppController(Facebook facebook, ConnectionRepository connectionRepository) {
	        this.facebook = facebook;
	        this.connectionRepository = connectionRepository;
	    }*/
	/**
	 * This method will list all existing users.
	 */
	@RequestMapping("/user")
	public Principal user(Principal principal) {
		return principal;
	}

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String Home(ModelMap model) {

		List<NewsConten> news = newsService.findAllNews();
		model.addAttribute("news", news);
		List<UserDocument> listdocuments = userDocumentService.findAll();
		model.addAttribute("listdocuments", listdocuments);
		model.addAttribute("loggedinuser", getPrincipal());
		return "menu_home";
	}
/*    @GetMapping
    public String helloFacebook(Model model) {
        if (connectionRepository.findPrimaryConnection(Facebook.class) == null) {
            return "redirect:/connect/facebook";
        }

        model.addAttribute("facebookProfile", facebook.userOperations().getUserProfile());
        PagedList<Post> feed = facebook.feedOperations().getFeed();
        model.addAttribute("feed", feed);
        return "menu_home";
    }*/
	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {

		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		model.addAttribute("loggedinuser", getPrincipal());
		return "userslist";
	}

	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * saving user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "registration";
		}

		/*
		 * Preferred way to achieve uniqueness of field [sso] should be
		 * implementing custom @Unique annotation and applying it on field [sso]
		 * of Model class [User].
		 * 
		 * Below mentioned peace of code [if block] is to demonstrate that you
		 * can fill custom errors outside the validation framework as well while
		 * still using internationalized messages.
		 * 
		 */
		if (!userService.isUserSSOUnique(user.getId(), user.getSsoId())) {
			FieldError ssoError = new FieldError("user", "ssoId", messageSource.getMessage("non.unique.ssoId",
					new String[] { user.getSsoId() }, Locale.getDefault()));
			result.addError(ssoError);
			return "registration";
		}

		userService.saveUser(user);

		model.addAttribute("success",
				"User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		// return "success";
		return "registrationsuccess";
	}

	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String ssoId, ModelMap model) {
		User user = userService.findBySSO(ssoId);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		model.addAttribute("loggedinuser", getPrincipal());
		return "registration";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model, @PathVariable String ssoId) {

		if (result.hasErrors()) {
			return "registration";
		}

		/*
		 * //Uncomment below 'if block' if you WANT TO ALLOW UPDATING SSO_ID in
		 * UI which is a unique key to a User.
		 * if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
		 * FieldError ssoError =new
		 * FieldError("user","ssoId",messageSource.getMessage(
		 * "non.unique.ssoId", new String[]{user.getSsoId()},
		 * Locale.getDefault())); result.addError(ssoError); return
		 * "registration"; }
		 */

		userService.updateUser(user);

		model.addAttribute("success",
				"User " + user.getFirstName() + " " + user.getLastName() + " updated successfully");
		model.addAttribute("loggedinuser", getPrincipal());
		return "registrationsuccess";
	}

	/**
	 * This method will delete an user by it's SSOID value.
	 */
	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		userService.deleteUserBySSO(ssoId);
		return "redirect:/home";
	}

	/**
	 * This method will provide UserProfile list to views
	 */
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}

	/**
	 * This method handles Access-Denied redirect.
	 */
	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
		return "accessDenied";
	}

	/**
	 * This method handles login GET requests. If users is already logged-in and
	 * tries to goto login page again, will be redirected to list page.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		if (isCurrentAuthenticationAnonymous()) {
			return "login";
		} else {
			return "redirect:/home";
		}
	}

	/**
	 * This method handles logout requests. Toggle the handlers if you are
	 * RememberMe functionality is useless in your app.
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			// new SecurityContextLogoutHandler().logout(request, response,
			// auth);
			persistentTokenBasedRememberMeServices.logout(request, response, auth);
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/login?logout";
	}

	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	/**
	 * This method returns true if users is already authenticated [logged-in],
	 * else false.
	 */
	private boolean isCurrentAuthenticationAnonymous() {
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return authenticationTrustResolver.isAnonymous(authentication);
	}

	@RequestMapping(value = { "/managenews" }, method = RequestMethod.GET)
	public String listNews(ModelMap model) {
		List<NewsConten> news = newsService.findAllNews();
		model.addAttribute("news", news);
		List<UserDocument> listdocuments = userDocumentService.findAll();
		model.addAttribute("listdocuments", listdocuments);
		return "index";
	}

	@RequestMapping(value = { "/newscontent" }, method = RequestMethod.GET)
	public String newsContent(ModelMap model) {
		NewsConten newlist = new NewsConten();
		model.addAttribute("newlist", newlist);
		List<NewsConten> news = newsService.findAllNews();
		model.addAttribute("news", news);
		List<UserDocument> listdocuments = userDocumentService.findAll();
		model.addAttribute("listdocuments", listdocuments);
		model.addAttribute("news", news);
		model.addAttribute("edit", false);
		return "ckeditor";
	}

	@RequestMapping(value = { "/news-{Id}" }, method = RequestMethod.GET)
	public String ListNews(@PathVariable String Id, ModelMap model) {
		Integer idnews = Integer.parseInt(Id);
		NewsConten newlist = newsService.findById(idnews);
		model.addAttribute("newlist", newlist);
		List<NewsConten> news = newsService.findAllNews();
		model.addAttribute("news", news);
		List<UserDocument> listdocuments = userDocumentService.findAll();
		model.addAttribute("listdocuments", listdocuments);
		List<UserDocument> documents = userDocumentService.findAllByUserId(idnews);
		model.addAttribute("documents", documents);
		return "NewsIfo";
	}

	@RequestMapping(value = { "/newscontent" }, method = RequestMethod.POST)
	public String saveNews(NewsConten newspost, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "index";
		}

		newsService.saveNews(newspost);

		model.addAttribute("success", " comit successfully");
		List<NewsConten> news = newsService.findAllNews();
		model.addAttribute("news", news);
		List<UserDocument> listdocuments = userDocumentService.findAll();
		model.addAttribute("listdocuments", listdocuments);
		// return "success";
		return "index";
	}

	@RequestMapping(value = { "/edit-news-{Id}" }, method = RequestMethod.GET)
	public String editNews(@PathVariable String Id, ModelMap model) {
		Integer idnews = Integer.parseInt(Id);
		NewsConten newlist = newsService.findById(idnews);
		model.addAttribute("newlist", newlist);

		List<NewsConten> news = newsService.findAllNews();
		List<UserDocument> listdocuments = userDocumentService.findAll();
		model.addAttribute("listdocuments", listdocuments);
		model.addAttribute("news", news);
		model.addAttribute("edit", true);
		return "ckeditor";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-news-{Id}" }, method = RequestMethod.POST)
	public String updateNews(@Valid NewsConten newspost, BindingResult result, ModelMap model,
			@PathVariable String Id) {

		if (result.hasErrors()) {
			return "index";
		}

		newsService.updateNews(newspost);
		List<NewsConten> news = newsService.findAllNews();
		model.addAttribute("news", news);
		List<UserDocument> listdocuments = userDocumentService.findAll();
		model.addAttribute("listdocuments", listdocuments);
		model.addAttribute("success", " updated successfully");
		return "index";
	}

	@RequestMapping(value = { "/delete-news-{Id}" }, method = RequestMethod.GET)
	public String deleteNews(@PathVariable Integer Id, ModelMap model) {
		newsService.deleteNewByID(Id);
		List<NewsConten> news = newsService.findAllNews();
		model.addAttribute("news", news);
		List<UserDocument> listdocuments = userDocumentService.findAll();
		model.addAttribute("listdocuments", listdocuments);
		model.addAttribute("success", " delete successfully");
		return "index";
	}

	@RequestMapping(value = { "/add-document-{newsId}" }, method = RequestMethod.GET)
	public String addDocuments(@PathVariable int newsId, ModelMap model) {
		NewsConten newslist = newsService.findById(newsId);
		model.addAttribute("newslist", newslist);
		List<NewsConten> news = newsService.findAllNews();
 		model.addAttribute("news", news);
		FileBucket fileModel = new FileBucket();
		model.addAttribute("fileBucket", fileModel);
			
		List<UserDocument> documents = userDocumentService.findAllByNewsId(newsId);
		model.addAttribute("documents", documents);
		List<UserDocument> listdocuments = userDocumentService.findAll();
		model.addAttribute("listdocuments", listdocuments);
		return "managedocuments";
	}
	

	@RequestMapping(value = { "/download-document-{newsId}-{docId}" }, method = RequestMethod.GET)
	public String downloadDocument(@PathVariable String newsId, @PathVariable int docId, HttpServletResponse response) throws IOException {
		UserDocument document = userDocumentService.findById(docId);
		response.setContentType(document.getType());
        response.setContentLength(document.getContent().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getName() +"\"");
 
        FileCopyUtils.copy(document.getContent(), response.getOutputStream());
 
 		return "redirect:/add-document-"+newsId;
	}

	@RequestMapping(value = { "/delete-document-{newsId}-{docId}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable int newsId, @PathVariable int docId) {
		userDocumentService.deleteById(docId);
		return "redirect:/add-document-"+newsId;
	}

	@RequestMapping(value = { "/add-document-{newsId}" }, method = RequestMethod.POST)
	public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model, @PathVariable int newsId) throws IOException{
		
		if (result.hasErrors()) {
			System.out.println("validation errors");
			NewsConten newslist = newsService.findById(newsId);
			model.addAttribute("newslist", newslist);
			List<NewsConten> news = newsService.findAllNews();
	 		model.addAttribute("news", news);

			List<UserDocument> documents = userDocumentService.findAllByNewsId(newsId);
			model.addAttribute("documents", documents);
			
			return "managedocuments";
		} else {
			
			System.out.println("Fetching file");
			
			NewsConten newslist = newsService.findById(newsId);
			model.addAttribute("newslist", newslist);
			List<NewsConten> news = newsService.findAllNews();
	 		model.addAttribute("news", news);

			saveDocument(fileBucket, newslist);

			return "redirect:/add-document-"+newsId;
		}
	}
	
	private void saveDocument(FileBucket fileBucket, NewsConten news) throws IOException{
		
		UserDocument document = new UserDocument();
		
		MultipartFile multipartFile = fileBucket.getFile();
		
		document.setName(multipartFile.getOriginalFilename());
		document.setDescription(fileBucket.getDescription());
		document.setType(multipartFile.getContentType());
		document.setContent(multipartFile.getBytes());
		document.setNews(news);
		userDocumentService.saveDocument(document);
	}
}