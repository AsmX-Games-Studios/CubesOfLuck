# ../Cube_of_luck/index.asmX

@using label lose;
@using label winner;

@using label print_rules;
@using subprogram logic_game;

@call print("Start game 'Cube of luck'!");
@Execute goto print_rules;
@Execute goto_sbp logic_game;

@subprogram logic_game:
    @Execute rand 1 6
    @set cude_1 Int $math
    @Execute rand 1 6
    @set cude_2 Int $math
    @Add set::cude_1 set::cude_2
    @set total Int $ret
    @Execute eq set::total 7
    @Execute jmp_equal winner
    @Execute eq set::total 11
    @Execute jmp_equal winner
    @Execute eq set::total 2
    @Execute jmp_equal lose
    @Execute eq set::total 7
    @Execute jmp_equal lose
    @Execute eq set::total 12
    @Execute jmp_equal lose
    @Execute cmp 11 set::total
    @Execute jmp_great lose;

@label print_rules:
    @call print("----------------------------------------------------------------")
    @call print("Rules: ")
    @call print("1. The player rolls two dice with numbers from 1 to 6")
    @call print("2. If the sum of the numbers in the dice is 7 or 11 the player wins the game.")
    @call print("3. If the sum of the numbers in the dice is 2 3 or 12 the player loses the game.")
    @call print("----------------------------------------------------------------")

@label lose:
    @call print("Lose!");

@label winner:
    @call print("Winner!");