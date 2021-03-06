package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class CreateDiscount_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <style>\n");
      out.write("            @import url('https://fonts.googleapis.com/css?family=Poppins');\n");
      out.write("\n");
      out.write("            /* BASIC */\n");
      out.write("\n");
      out.write("            html {\n");
      out.write("                background-color: #56baed;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            body {\n");
      out.write("                font-family: \"Poppins\", sans-serif;\n");
      out.write("                height: 100vh;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a {\n");
      out.write("                color: #92badd;\n");
      out.write("                display:inline-block;\n");
      out.write("                text-decoration: none;\n");
      out.write("                font-weight: 400;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            h2 {\n");
      out.write("                text-align: center;\n");
      out.write("                font-size: 16px;\n");
      out.write("                font-weight: 600;\n");
      out.write("                text-transform: uppercase;\n");
      out.write("                display:inline-block;\n");
      out.write("                margin: 40px 8px 10px 8px; \n");
      out.write("                color: #cccccc;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            /* STRUCTURE */\n");
      out.write("\n");
      out.write("            .wrapper {\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                flex-direction: column; \n");
      out.write("                justify-content: center;\n");
      out.write("                width: 100%;\n");
      out.write("                min-height: 100%;\n");
      out.write("                padding: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #formContent {\n");
      out.write("                -webkit-border-radius: 10px 10px 10px 10px;\n");
      out.write("                border-radius: 10px 10px 10px 10px;\n");
      out.write("                background: #fff;\n");
      out.write("                padding: 30px;\n");
      out.write("                width: 90%;\n");
      out.write("                max-width: 450px;\n");
      out.write("                position: relative;\n");
      out.write("                padding: 0px;\n");
      out.write("                -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);\n");
      out.write("                box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #formFooter {\n");
      out.write("                background-color: #f6f6f6;\n");
      out.write("                border-top: 1px solid #dce8f1;\n");
      out.write("                padding: 25px;\n");
      out.write("                text-align: center;\n");
      out.write("                -webkit-border-radius: 0 0 10px 10px;\n");
      out.write("                border-radius: 0 0 10px 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            /* TABS */\n");
      out.write("\n");
      out.write("            h2.inactive {\n");
      out.write("                color: #cccccc;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            h2.active {\n");
      out.write("                color: #0d0d0d;\n");
      out.write("                border-bottom: 2px solid #5fbae9;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            /* FORM TYPOGRAPHY*/\n");
      out.write("\n");
      out.write("            input[type=button], input[type=submit], input[type=reset]  {\n");
      out.write("                background-color: #56baed;\n");
      out.write("                border: none;\n");
      out.write("                color: white;\n");
      out.write("                padding: 15px 80px;\n");
      out.write("                text-align: center;\n");
      out.write("                text-decoration: none;\n");
      out.write("                display: inline-block;\n");
      out.write("                text-transform: uppercase;\n");
      out.write("                font-size: 13px;\n");
      out.write("                -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);\n");
      out.write("                box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);\n");
      out.write("                -webkit-border-radius: 5px 5px 5px 5px;\n");
      out.write("                border-radius: 5px 5px 5px 5px;\n");
      out.write("                margin: 5px 20px 40px 20px;\n");
      out.write("                -webkit-transition: all 0.3s ease-in-out;\n");
      out.write("                -moz-transition: all 0.3s ease-in-out;\n");
      out.write("                -ms-transition: all 0.3s ease-in-out;\n");
      out.write("                -o-transition: all 0.3s ease-in-out;\n");
      out.write("                transition: all 0.3s ease-in-out;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {\n");
      out.write("                background-color: #39ace7;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {\n");
      out.write("                -moz-transform: scale(0.95);\n");
      out.write("                -webkit-transform: scale(0.95);\n");
      out.write("                -o-transform: scale(0.95);\n");
      out.write("                -ms-transform: scale(0.95);\n");
      out.write("                transform: scale(0.95);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=text] {\n");
      out.write("                background-color: #f6f6f6;\n");
      out.write("                border: none;\n");
      out.write("                color: #0d0d0d;\n");
      out.write("                padding: 15px 32px;\n");
      out.write("                text-align: center;\n");
      out.write("                text-decoration: none;\n");
      out.write("                display: inline-block;\n");
      out.write("                font-size: 16px;\n");
      out.write("                margin: 5px;\n");
      out.write("                width: 85%;\n");
      out.write("                border: 2px solid #f6f6f6;\n");
      out.write("                -webkit-transition: all 0.5s ease-in-out;\n");
      out.write("                -moz-transition: all 0.5s ease-in-out;\n");
      out.write("                -ms-transition: all 0.5s ease-in-out;\n");
      out.write("                -o-transition: all 0.5s ease-in-out;\n");
      out.write("                transition: all 0.5s ease-in-out;\n");
      out.write("                -webkit-border-radius: 5px 5px 5px 5px;\n");
      out.write("                border-radius: 5px 5px 5px 5px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=text]:focus {\n");
      out.write("                background-color: #fff;\n");
      out.write("                border-bottom: 2px solid #5fbae9;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=text]:placeholder {\n");
      out.write("                color: #cccccc;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            /* ANIMATIONS */\n");
      out.write("\n");
      out.write("            /* Simple CSS3 Fade-in-down Animation */\n");
      out.write("            .fadeInDown {\n");
      out.write("                -webkit-animation-name: fadeInDown;\n");
      out.write("                animation-name: fadeInDown;\n");
      out.write("                -webkit-animation-duration: 1s;\n");
      out.write("                animation-duration: 1s;\n");
      out.write("                -webkit-animation-fill-mode: both;\n");
      out.write("                animation-fill-mode: both;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @-webkit-keyframes fadeInDown {\n");
      out.write("                0% {\n");
      out.write("                    opacity: 0;\n");
      out.write("                    -webkit-transform: translate3d(0, -100%, 0);\n");
      out.write("                    transform: translate3d(0, -100%, 0);\n");
      out.write("                }\n");
      out.write("                100% {\n");
      out.write("                    opacity: 1;\n");
      out.write("                    -webkit-transform: none;\n");
      out.write("                    transform: none;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @keyframes fadeInDown {\n");
      out.write("                0% {\n");
      out.write("                    opacity: 0;\n");
      out.write("                    -webkit-transform: translate3d(0, -100%, 0);\n");
      out.write("                    transform: translate3d(0, -100%, 0);\n");
      out.write("                }\n");
      out.write("                100% {\n");
      out.write("                    opacity: 1;\n");
      out.write("                    -webkit-transform: none;\n");
      out.write("                    transform: none;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Simple CSS3 Fade-in Animation */\n");
      out.write("            @-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }\n");
      out.write("            @-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }\n");
      out.write("            @keyframes fadeIn { from { opacity:0; } to { opacity:1; } }\n");
      out.write("\n");
      out.write("            .fadeIn {\n");
      out.write("                opacity:0;\n");
      out.write("                -webkit-animation:fadeIn ease-in 1;\n");
      out.write("                -moz-animation:fadeIn ease-in 1;\n");
      out.write("                animation:fadeIn ease-in 1;\n");
      out.write("\n");
      out.write("                -webkit-animation-fill-mode:forwards;\n");
      out.write("                -moz-animation-fill-mode:forwards;\n");
      out.write("                animation-fill-mode:forwards;\n");
      out.write("\n");
      out.write("                -webkit-animation-duration:1s;\n");
      out.write("                -moz-animation-duration:1s;\n");
      out.write("                animation-duration:1s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .fadeIn.first {\n");
      out.write("                -webkit-animation-delay: 0.4s;\n");
      out.write("                -moz-animation-delay: 0.4s;\n");
      out.write("                animation-delay: 0.4s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .fadeIn.second {\n");
      out.write("                -webkit-animation-delay: 0.6s;\n");
      out.write("                -moz-animation-delay: 0.6s;\n");
      out.write("                animation-delay: 0.6s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .fadeIn.third {\n");
      out.write("                -webkit-animation-delay: 0.8s;\n");
      out.write("                -moz-animation-delay: 0.8s;\n");
      out.write("                animation-delay: 0.8s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .fadeIn.fourth {\n");
      out.write("                -webkit-animation-delay: 1s;\n");
      out.write("                -moz-animation-delay: 1s;\n");
      out.write("                animation-delay: 1s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Simple CSS3 Fade-in Animation */\n");
      out.write("            .underlineHover:after {\n");
      out.write("                display: block;\n");
      out.write("                left: 0;\n");
      out.write("                bottom: -10px;\n");
      out.write("                width: 0;\n");
      out.write("                height: 2px;\n");
      out.write("                background-color: #56baed;\n");
      out.write("                content: \"\";\n");
      out.write("                transition: width 0.2s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .underlineHover:hover {\n");
      out.write("                color: #0d0d0d;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .underlineHover:hover:after{\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            /* OTHERS */\n");
      out.write("\n");
      out.write("            *:focus {\n");
      out.write("                outline: none;\n");
      out.write("            } \n");
      out.write("\n");
      out.write("            #icon {\n");
      out.write("                width:60%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            * {\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"wrapper fadeInDown\">\n");
      out.write("            <div id=\"formContent\">\n");
      out.write("                \n");
      out.write("                <h2 class=\"active\">Create Discount</h2>\n");
      out.write("\n");
      out.write("                <!-- Icon -->\n");
      out.write("                <div class=\"fadeIn first\">\n");
      out.write("                    <img src=\"img/sach.png\" id=\"icon\" alt=\"User Icon\"  />\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!-- Login Form -->\n");
      out.write("                <form action=\"DiscountServlet\" method=\"post\">\n");
      out.write("                    <div>\n");
      out.write("                        Discount ID:<input type=\"text\" id=\"login\"  name=\"txtdiscountID\" placeholder=\"Discount id....\" /></br>\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        Description:<input type=\"text\" id=\"password\" name=\"txtdiscountDescription\" placeholder=\"Description....\">\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        Percent:<input type=\"text\" id=\"login\"  name=\"txtpercent\" placeholder=\"Percent....\" /></br>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <input type=\"submit\"  name=\"action\" value=\"CreateDiscount\">\n");
      out.write("\n");
      out.write("                </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("                   \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
