<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link rel="stylesheet" href="resources/css/home.css">
    <!-- End layout styles -->
    <link rel="stylesheet" href="resources/js/home.js"/>
</head>
<body>

<div class="mobile-wrap">
    <div class="mobile clearfix">
        <div class="header">
            <span class="ion-ios-navicon pull-left"><i></i></span>
            <span class="title">Home</span>
            <span class="ion-ios-search pull-right"></span>
            <div class="search">
                <form method="post">
                    <input type="search" placeholder="Search Here">
                </form>
            </div>
        </div>
        <div class="sidebar">
            <div class="sidebar-overlay"></div>
            <div class="sidebar-content">
                <div class="top-head">
                    <div class="name">Mohan Khadka</div>
                    <div class="email">contact@mohankhadka.com.np</div>
                </div>
                <div class="nav-left">
                    <a href="#home"><span class="ion-ios-home-outline"></span> Home</a>
                    <a href="#alarm"><span class="ion-ios-list-outline"></span> Alarm</a>
                    <a href="#compose"><span class="ion-ios-compose-outline"></span> Compose</a>
                    <a href="#chats"><span class="ion-ios-chatboxes-outline"></span> Chats</a>
                    <a href="#profile"><span class="ion-ios-person-outline"></span> Profile</a>
                    <a href="#settings"><span class="ion-ios-gear-outline"></span> Settings</a>
                    <a href="#credits"><span class="ion-ios-information-outline"></span> Credits</a>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="html search">
                <div class="title bounceInDown animated">Search Result</div>
                <p class="flipInX animated">Sorry,<br>no matches found for <b class="key"></b></p>
            </div>
            <div class="html welcome visible">
                <div class="datetime">
                    <div class="day lightSpeedIn animated">Thursday</div>
                    <div class="date lightSpeedIn animated">June 18, 2015</div>
                    <div class="time lightSpeedIn animated">08:00 AM</div>
                </div>
            </div>
            <div class="html alarm">
                <div class="forecast clearfix">
                    <div class="datetime pull-left bounceInLeft animated">
                        <div class="day">Thursday</div>
                        <div class="date">June 18, 2015</div>
                    </div>
                    <div class="temperature pull-right bounceInRight animated">
                        <div class="unit"><span class="ion-ios-sunny-outline"></span> 34<i>&deg;</i></div>
                        <div class="location">Kathmandu, Nepal</div>
                    </div>
                </div>
                <div class="alarm-list">
                    <div class="note clearfix slideInRight animated">
                        <div class="time pull-left">
                            <div class="hour">9</div>
                            <div class="shift">AM</div>
                        </div>
                        <div class="to-do pull-left">
                            <div class="title">Finish HTML Coding</div>
                            <div class="subject">Web UI</div>
                        </div>
                    </div>
                    <div class="note clearfix slideInRight animated">
                        <div class="time pull-left">
                            <div class="hour">1</div>
                            <div class="shift">PM</div>
                        </div>
                        <div class="to-do pull-left">
                            <div class="title">Lunch Break</div>
                            <div class="subject"></div>
                        </div>
                    </div>
                    <div class="note clearfix slideInRight animated" data-revert="slideOutRight">
                        <div class="time pull-left">
                            <div class="hour">3</div>
                            <div class="shift">PM</div>
                        </div>
                        <div class="to-do pull-left">
                            <div class="title">Design Stand Up</div>
                            <div class="subject">Hangouts</div>
                            <div class="user-list clearfix">
                                <div class="user pull-left"><img src="https://raw.githubusercontent.com/khadkamhn/secret-project/master/img/usr-i.png"></div>
                                <div class="user pull-left"><img src="https://raw.githubusercontent.com/khadkamhn/secret-project/master/img/usr-ii.png"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="html compose">
                <div class="forms">
                    <div class="group clearfix slideInRight animated">
                        <label class="pull-left" for="compose-time"><span class="ion-ios-time-outline"></span> Time</label>
                        <input class="pull-right" id="compose-time" type="time">
                    </div>
                    <div class="group clearfix slideInLeft animated">
                        <label class="pull-left" for="compose-date"><span class="ion-ios-calendar-outline"></span> Date</label>
                        <input class="pull-right" id="compose-date" type="date">
                    </div>
                    <div class="group clearfix slideInRight animated">
                        <label class="pull-left" for="compose-title"><span class="ion-ios-paper-outline"></span> Title</label>
                        <input class="pull-right" id="compose-title" type="text">
                    </div>
                    <div class="group clearfix slideInLeft animated">
                        <label class="visible" for="compose-detail"><span class="ion-ios-list-outline"></span> Task</label>
                        <textarea class="visible" id="compose-detail" rows="3"></textarea>
                    </div>
                    <div class="action flipInY animated">
                        <button class="btn">Compose</button>
                    </div>
                </div>
            </div>
            <div class="html chats">
                <div class="tabs-list clearfix">
                    <a href="#" class="tab active">Users</a>
                    <a href="#" class="tab">Messages</a>
                    <a href="#" class="tab">Groups</a>
                </div>
                <div class="active-users">
                    <div class="user clearfix rotateInDownLeft animated">
                        <div class="photo pull-left">
                            <img src="https://s3.amazonaws.com/uifaces/faces/twitter/adhamdannaway/128.jpg">
                        </div>
                        <div class="desc pull-left">
                            <p class="name">Connor Hartigan</p>
                            <p class="position">Web &amp; UI Designer</p>
                        </div>
                        <div class="idle pull-right"><span class="away"></span></div>
                    </div>
                    <div class="user clearfix rotateInDownRight animated">
                        <div class="photo pull-left">
                            <img src="https://s3.amazonaws.com/uifaces/faces/twitter/markmushiva/128.jpg">
                        </div>
                        <div class="desc pull-left">
                            <p class="name">Jacob Lennon</p>
                            <p class="position">Front-End Developer</p>
                        </div>
                        <div class="idle pull-right"><span class="offline"></span></div>
                    </div>
                    <div class="user clearfix rotateInDownLeft animated">
                        <div class="photo pull-left">
                            <img src="https://s3.amazonaws.com/uifaces/faces/twitter/scottohara/128.jpg">
                        </div>
                        <div class="desc pull-left">
                            <p class="name">Didier Mailly</p>
                            <p class="position">Co-Founder</p>
                        </div>
                        <div class="idle pull-right"><span class="away"></span></div>
                    </div>
                    <div class="user clearfix rotateInDownRight animated">
                        <div class="photo pull-left">
                            <img src="https://s3.amazonaws.com/uifaces/faces/twitter/shalt0ni/128.jpg">
                        </div>
                        <div class="desc pull-left">
                            <p class="name">Miguel Cunha Ferreira</p>
                            <p class="position">Sales Manager</p>
                        </div>
                        <div class="idle pull-right"><span class="online"></span></div>
                    </div>
                    <div class="user clearfix rotateInDownLeft animated">
                        <div class="photo pull-left">
                            <img src="https://s3.amazonaws.com/uifaces/faces/twitter/sircookieface/128.jpg">
                        </div>
                        <div class="desc pull-left">
                            <p class="name">Eric Yuriev</p>
                            <p class="position">App Developer</p>
                        </div>
                        <div class="idle pull-right"><span class="online"></span></div>
                    </div>
                    <div class="user clearfix rotateInDownRight animated">
                        <div class="photo pull-left">
                            <img src="https://s3.amazonaws.com/uifaces/faces/twitter/ryanmclaughlin/128.jpg">
                        </div>
                        <div class="desc pull-left">
                            <p class="name">Theodore Clark</p>
                            <p class="position">Project Manager</p>
                        </div>
                        <div class="idle pull-right"><span class="online"></span></div>
                    </div>
                </div>
            </div>
            <div class="html settings">
                <div class="setting-list">
                    <div class="gear clearfix slideInRight animated">
</body>
</html>