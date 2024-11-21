var isMauButtonClicked = false;
var isMacButtonClicked = false;
var isarsenalButtonClicked = false;
var isastonvilaButtonClicked = false;
var isbrithonButtonClicked = false;
var ischelseaButtonClicked = false;
var isliverpoolButtonClicked = false;
var isnewcastleButtonClicked = false;
var istottenhamButtonClicked = false;
var iswesthamButtonClicked = false;

function success(i){
	if(i == 'admin'){
		alert("추가완료");
	}else{
		alert("투표 성공!");
	}
}
// 1번째 라인
function changeBackgroundColor1(buttonId) {
    var divide1 = document.querySelector('.showvboo_1_bar_divide1');
    var divide2 = document.querySelector('.showvboo_1_bar_divide2');

    var mauButton = document.getElementById('team1');
    var macButton = document.getElementById('team2');

    if (buttonId === 'team1' && !isMauButtonClicked) {
        // Mau 버튼 클릭
        divide1.style.backgroundColor = "rgb(70, 70, 70)";
      divide2.style.backgroundColor = "rgb(110, 110, 110)";
    } else if (buttonId === 'team2' && !isMacButtonClicked) {
        // Mac 버튼 클릭
        divide2.style.backgroundColor = "rgb(70, 70, 70)";
        divide1.style.backgroundColor = "rgb(110, 110, 110)";
    }
}

// 2번째 라인
function changeBackgroundColor2(buttonId) {
    var divide3 = document.querySelector('.showvboo_2_bar_divide1');
    var divide4 = document.querySelector('.showvboo_2_bar_divide2');

    var arsenalButton = document.getElementById('team3');
    var tottenhamButton = document.getElementById('team4');

    if (buttonId === 'team3' && !isarsenalButtonClicked) {
        // Mau 버튼 클릭
        divide3.style.backgroundColor = "rgb(70, 70, 70)";
        divide4.style.backgroundColor = "rgb(110, 110, 110)";
    } else if (buttonId === 'team4' && !istottenhamButtonClicked) {
        // Mac 버튼 클릭
        divide4.style.backgroundColor = "rgb(70, 70, 70)";
        divide3.style.backgroundColor = "rgb(110, 110, 110)";
    }
}

// 나머지 라인
function changeBackgroundColor3(buttonId) {
    var divide5 = document.querySelector('.showvboo_3_bar_divide1');
    var divide6 = document.querySelector('.showvboo_3_bar_divide2');

    var chelseaButton = document.getElementById('team5');
    var westhamButton = document.getElementById('team6');

    if (buttonId === 'team5' && !ischelseaButtonClicked) {
        // Mau 버튼 클릭
        divide5.style.backgroundColor = "rgb(70, 70, 70)";
     divide6.style.backgroundColor = "rgb(110, 110, 110)";
    } else if (buttonId === 'team6' && !iswesthamButtonClicked) {
        // Mac 버튼 클릭
        divide6.style.backgroundColor = "rgb(70, 70, 70)";
      divide5.style.backgroundColor = "rgb(110, 110, 110)";
    }
}

function changeBackgroundColor4(buttonId) {
    var divide7 = document.querySelector('.showvboo_4_bar_divide1');
    var divide8 = document.querySelector('.showvboo_4_bar_divide2');

    var astonvilaButton = document.getElementById('team7');
    var newcastleButton = document.getElementById('team8');

    if (buttonId === 'team7' && !isastonvilaButtonClicked) {
        // Mau 버튼 클릭
        divide7.style.backgroundColor = "rgb(70, 70, 70)";
       divide8.style.backgroundColor = "rgb(110, 110, 110)";
    } else if (buttonId === 'team8' && !isnewcastleButtonClicked) {
        // Mac 버튼 클릭
        divide8.style.backgroundColor = "rgb(70, 70, 70)";
       divide9.style.backgroundColor = "rgb(110, 110, 110)";
    }
}

function changeBackgroundColor5(buttonId) {
    var divide9 = document.querySelector('.showvboo_5_bar_divide1');
    var divide10 = document.querySelector('.showvboo_5_bar_divide2');

    var liverpoolButton = document.getElementById('team9');
    var brithonButton = document.getElementById('team10');

    if (buttonId === 'team9' && !isliverpoolButtonClicked) {
        // Mau 버튼 클릭
        divide9.style.backgroundColor = "rgb(70, 70, 70)";
divide10.style.backgroundColor = "rgb(110, 110, 110)";      
    } else if (buttonId === 'team10' && !isbrithonButtonClicked) {
        divide10.style.backgroundColor = "rgb(70, 70, 70)";
       divide9.style.backgroundColor = "rgb(110, 110, 110)";
    }
}

function resetButtons() {
    // 클릭 여부 변수 초기화
    isMauButtonClicked = false;
    isMacButtonClicked = false;
    isarsenalButtonClicked = false;
    isastonvilaButtonClicked = false;
    isbrithonButtonClicked = false;
    ischelseaButtonClicked = false;
    isliverpoolButtonClicked = false;
    isnewcastleButtonClicked = false;
    istottenhamButtonClicked = false;
    iswesthamButtonClicked = false;

    // 스타일 초기화
    var divideElements = document.querySelectorAll('.showvboo_1_bar_divide1, .showvboo_1_bar_divide2, .showvboo_2_bar_divide1, .showvboo_2_bar_divide2, .showvboo_3_bar_divide1, .showvboo_3_bar_divide2, .showvboo_4_bar_divide1, .showvboo_4_bar_divide2, .showvboo_5_bar_divide1, .showvboo_5_bar_divide2');
    divideElements.forEach(function (element) {
        element.style.backgroundColor = "rgb(110, 110, 110)";
    });

    // 버튼 활성화 초기화
    var allButtons = document.querySelectorAll('.team1, .team2, .team3, .team4, .team5, .team6, .team7, .team8, .team9, .team10');
    allButtons.forEach(function (button) {
        button.disabled = false;
    });
}