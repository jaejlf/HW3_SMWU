package Homework1.src;

public class Main extends NumbersPlayer {
    public static void main(String[] args) throws Exception {

        NumbersPlayer num = new NumbersPlayer();
        String menu;
        String selectedAlgorithm = NOT_SELECTED;

        while (true) {
            
            num.printDefaultMenu();
            menu = scanner.next();
            scanner.nextLine();// 버퍼 비우기

            if (menu.equals(ALGORITHM_SELECTION)) {
                num.printAlgorithmSelectionMenu();
                selectedAlgorithm = scanner.next();
                scanner.nextLine();// 버퍼 비우기

            } else if (menu.equals(SORTING)) {
                if (!selectedAlgorithm.equals(NOT_SELECTED)) {
                    num.sortNumbersArr(selectedAlgorithm);
                    num.printSortingResult();

                } else {
                    System.out.println("아직 알고리즘을 선택하지 않았습니다.");
                    
                }

            } else if (menu.equals(QUIT)) {
                break;

            } else {
                System.out.println("잘못된 입력값입니다.");
            }

        }
    }
}