use std::io;
use std::fmt;

fn main() {
    // 게임판을 초기화합니다.
    let mut board = [[0; 19]; 19];

    // 사용자의 입력을 받습니다.
    let mut x = String::new();
    io::stdin().read_line(&mut x).expect("입력 오류");

    let mut y = String::new();
    io::stdin().read_line(&mut y).expect("입력 오류");

    let x = match x.trim().parse::<i32>() {
        Ok(x) => x,
        Err(e) => {
            println!("입력 오류: {}", e);
            return;
        }
    };

    let y = match y.trim().parse::<i32>() {
        Ok(y) => y,
        Err(e) => {
            println!("입력 오류: {}", e);
            return;
        }
    };

    // 사용자의 입력을 화면에 출력합니다.
    println!("입력한 x: {}", x);
    println!("입력한 y: {}", y);

    // 게임판에 돌을 놓습니다.
    board[x][y] = 1;

    // 승패를 판정합니다.
    for i in 0..19 {
        for j in 0..19 {
            if board[i][j] == 5 {
                println!("승리!");
                return;
            }
        }
    }

    println!("무승부!");
}
