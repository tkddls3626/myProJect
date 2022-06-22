<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="UTF-8" />
    <title>회원평가</title>

</head>
<style>
    /* Containers */
    html, body {
        min-height: 100%;
    }

    body {
        font-family: sans-serif;
        /*background: #42426b;*/
        /*background-image: -webkit-linear-gradient(135deg, #8067B7, #EC87C0);*/
        /*background-image: linear-gradient(-45deg, #8067B7, #EC87C0);*/
        color: rgb(134, 110, 110);
    }

    .rb-box {
        width: 80%;
        max-width: 420px;
        margin: 50px auto;
        padding: 1.3em;
        background: #494956;
        border-radius: .75em;
        -webkit-filter: drop-shadow(1px 2px 5px rgba(0,0,0,.3));
        filter: drop-shadow(1px 2px 5px rgba(0,0,0,.3));
        /*box-shadow:*/
        /*        0 2px 2px rgba(243,49,128,.5),*/
        /*        0 0px 5px rgba(243,49,128,.15),*/
        /*        0 0px 4px rgba(0,0,0,.35),*/
        /*        0 5px 20px rgba(243,49,128,.25),*/
        /*        0 15px 50px rgba(243,49,128,.75),*/
        /*        inset 0 0 15px rgba(255,255,255,.05);*/
    }

    /* Custom Radio Button */
    p {
        font-size: .9em;
    }

    .rb {
        padding: 16px 0;
        text-align: center;
        background: rgba(255,255,255,.03);
        border-radius: .3em;
    }

    .rb-tab {
        display: inline-block;
        position: relative;
        width: 20%;
    }

    .rb-txt {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: .5em;
        color: #FFFFFF;
    }

    .rb-spot {
        position: absolute;
        width: 18px;
        height: 18px;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: transparent;
        border: 2px solid rgba(255,255,255,.3);
        border-radius: 100%;
        cursor: pointer;
        transition: ease .5s;
    }

    .rb-tab-active .rb-spot {
        background: rgba(0,0,0,.35);
        border: 2px solid rgba(243,49,128,.6);
    }

    /* Submit Button */
    .button-box {
        padding: 10px 0;
        text-align: center;
    }

    button {
        display: inline-block;
        width: 80%;
        margin-top: 1.2em;
        padding: 1em;
        max-width: 220px;
        font-size: .9em;
        color: #D42D78;
        text-transform: uppercase;
        text-decoration: none;
        letter-spacing: .15em;
        background: white;
        border: none;
        outline: none;
        border-radius: 5em;
        box-shadow: 0 15px 20px -10px rgba(0, 0, 0, 0.3);
        transition:
                color 0.6s,
                box-shadow 0.3s,
                transform 0.3s;
        cursor: pointer;
    }

    button:hover {
        box-shadow: 0 3px 5px -5px rgba(0, 0, 0, 0.3);
        color: #6f6f6f;
    }
</style>
<body>
<div class="rb-box" style="width: 90%;max-width: 430px; margin: -11px auto;">

    <!-- Radio Button Module -->
    <p>1. 기여도</p>
    <div id="rb-1" class="rb">
        <div class="rb-tab" data-value="1">
            <div class="rb-spot">
                <span class="rb-txt">1</span>
            </div>
        </div><div class="rb-tab" data-value="2">
        <div class="rb-spot">
            <span class="rb-txt">2</span>
        </div>
    </div><div class="rb-tab" data-value="3">
        <div class="rb-spot">
            <span class="rb-txt">3</span>
        </div>
    </div><div class="rb-tab" data-value="4">
        <div class="rb-spot">
            <span class="rb-txt">4</span>
        </div>
    </div><div class="rb-tab rb-tab-active" data-value="5">
        <div class="rb-spot">
            <span class="rb-txt">5</span>
        </div>
    </div>
    </div>

    <!-- Radio Button Module -->
    <p>2. 준비성</p>
    <div id="rb-2" class="rb">
        <div class="rb-tab" data-value="1">
            <div class="rb-spot">
                <span class="rb-txt">1</span>
            </div>
        </div><div class="rb-tab" data-value="2">
        <div class="rb-spot">
            <span class="rb-txt">2</span>
        </div>
    </div><div class="rb-tab" data-value="3">
        <div class="rb-spot">
            <span class="rb-txt">3</span>
        </div>
    </div><div class="rb-tab" data-value="4">
        <div class="rb-spot">
            <span class="rb-txt">4</span>
        </div>
    </div><div class="rb-tab rb-tab-active" data-value="5">
        <div class="rb-spot">
            <span class="rb-txt">5</span>
        </div>
    </div>
    </div>

    <!-- Radio Button Module -->
    <p>3. 대화</p>
    <div id="rb-3" class="rb">
        <div class="rb-tab" data-value="1">
            <div class="rb-spot">
                <span class="rb-txt">1</span>
            </div>
        </div><div class="rb-tab" data-value="2">
        <div class="rb-spot">
            <span class="rb-txt">2</span>
        </div>
    </div><div class="rb-tab" data-value="3">
        <div class="rb-spot">
            <span class="rb-txt">3</span>
        </div>
    </div><div class="rb-tab" data-value="4">
        <div class="rb-spot">
            <span class="rb-txt">4</span>
        </div>
    </div><div class="rb-tab rb-tab-active" data-value="5">
        <div class="rb-spot">
            <span class="rb-txt">5</span>
        </div>
    </div>
    </div>

    <!-- Radio Button Module -->
    <p>4. 청결</p>
    <div id="rb-4" class="rb">
        <div class="rb-tab" data-value="1">
            <div class="rb-spot">
                <span class="rb-txt">1</span>
            </div>
        </div><div class="rb-tab" data-value="2">
        <div class="rb-spot">
            <span class="rb-txt">2</span>
        </div>
    </div><div class="rb-tab" data-value="3">
        <div class="rb-spot">
            <span class="rb-txt">3</span>
        </div>
    </div><div class="rb-tab" data-value="4">
        <div class="rb-spot">
            <span class="rb-txt">4</span>
        </div>
    </div><div class="rb-tab rb-tab-active" data-value="5">
        <div class="rb-spot">
            <span class="rb-txt">5</span>
        </div>
    </div>
    </div>


    <!-- Button -->
    <div class="button-box">
        <button class="button" onclick="trigerFun()">Submit!</button>
    </div>

</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/browser.min.js"></script>
<script src="/js/breakpoints.min.js"></script>
<script src="/js/util.js"></script>
<script src="/js/main.js"></script>
<script type="text/javascript">
    /*
===============================================================

Hi! Welcome to my little playground!

My name is Tobias Bogliolo. 'Open source' by default and always 'responsive',
I'm a publicist, visual designer and frontend developer based in Barcelona.

Here you will find some of my personal experiments. Sometimes usefull,
sometimes simply for fun. You are free to use them for whatever you want
but I would appreciate an attribution from my work. I hope you enjoy it.

===============================================================
*/
    //Global:
    var survey = []; //Bidimensional array: [ [1,3], [2,4] ]
    let user_email = document.getElementById("reg_mb_nick").value;
    let user_name = document.getElementById("reg_mb_name").value;
    console.log(user_email);
    console.log(user_name)

    //Switcher function:
    $(".rb-tab").click(function(){
        //Spot switcher:
        $(this).parent().find(".rb-tab").removeClass("rb-tab-active");
        $(this).addClass("rb-tab-active");
    });

    //Save data:
    function trigerFun() {
        //Empty array:
        survey = [];
        let totalNum = 0;
        //Push data:
        for (i=1; i<=$(".rb").length; i++) {
            var rb = "rb" + i;
            var rbValue = parseInt($("#rb-"+i).find(".rb-tab-active").attr("data-value"));
            totalNum += parseInt(rbValue);
            //Bidimensional array push:
            survey.push(rbValue); //Bidimensional array: [ [1,3], [2,4] ]
        }
        totalNum = parseFloat(totalNum / 4);
        //Debug:
        /*평가 점수 ajax로 넘기기*/

        $.ajax({
            type: "GET", // get방식
            url: "/frined/setScore", // 파이썬으로 통신
            data: {
                "data": totalNum,
                "user_email" : user_email
            }, // area 데이터 값
            contentType: "application/json; charset=utf-8", // json 인코딩
            dataType: "text", //json타입
            success(result) {
                if(result === "success"){
                    alert("평가가 완료되었습니다.")
                window.location.href = '/mypageinfo';
                }
            },
            error: (log) => {
                alert("실패" + log)
            }

        });

    }


</script>
</body>
</html>


