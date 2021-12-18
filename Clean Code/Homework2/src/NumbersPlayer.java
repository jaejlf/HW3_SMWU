package Homework2.src;

interface Printer {
    public void printDefaultMenu();
    public void printAlgorithmSelectionMenu();
    public void printSortingResult();
}

interface Sorter {
    public void sortNumbersArr(String selectedAlgorithm);
}

public class NumbersPlayer extends SortArr implements Printer, Sorter {

    public void printDefaultMenu() {

        System.out.println();

        System.out.println("1. Select a sorting algorithm");
        System.out.println("2. Sort numbers");
        System.out.println("3. Quit");
        System.out.print("> ");

    }

    public void printAlgorithmSelectionMenu() {

        System.out.println();
        System.out.println("Select a sorting algorithm");
        System.out.println("1. Bubble sort");
        System.out.println("2. Quicksort");
        System.out.println("3. Insertion sort");
        System.out.print("> ");

    }

    public void printSortingResult() {

        System.out.print("Ascending ro descending (a or d) : ");
        String sortingOpt = scanner.nextLine();
        System.out.print("Result : ");
        if(sortingOpt.equals("a")){
            for (int i = 0; i < numbers.length; i++) {
                System.out.print(numbers[i] + " ");
            }
            System.out.println();
        }
        else if(sortingOpt.equals("d")){
            for (int i = numbers.length - 1; i >= 0; i--) {
                System.out.print(numbers[i] + " ");
            }
            System.out.println();
        }
    }

    public void sortNumbersArr(String selectedAlgorithm) {

        getNumbers();
        changeArrayTypeToInteger();

        if (selectedAlgorithm.equals(BUBBLE)) {
            sortNumbersUsingBubble();

        } else if (selectedAlgorithm.equals(QUICK)) {
            sortNumbersUsingQuick(0, numbers.length - 1);

        } else if(selectedAlgorithm.equals(INSERTION)){
            sortNumbersUsingInsertion();
        }
    }
}