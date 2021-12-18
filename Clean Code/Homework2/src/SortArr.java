package Homework2.src;

interface Numbers {
    public void getNumbers();
    public void changeArrayTypeToInteger();
    public int[] sortNumbersUsingBubble();
    public int[] sortNumbersUsingQuick(int start, int end);
    public int[] sortNumbersUsingInsertion();
}

public class SortArr implements Numbers, Constant {

    public String[] numbers_strType;
    public int[] numbers;

    public void getNumbers() {

        int nNumbers;
        String input_numbers;

        System.out.print("The number of numbers : ");
        nNumbers = Integer.parseInt(scanner.next());
        scanner.nextLine();// 버퍼 비우기

        numbers_strType = new String[nNumbers];
        numbers = new int[nNumbers];

        System.out.print("Numbers : ");
        input_numbers = scanner.nextLine();
        numbers_strType = input_numbers.split(" ");
    }

    public void changeArrayTypeToInteger() {

        for (int i = 0; i < numbers.length; i++) {
            numbers[i] = Integer.parseInt(numbers_strType[i]);
        }

    }

    public int[] sortNumbersUsingBubble() {

        for (int i = 0; i < numbers.length; i++) {
            for (int j = 0; j < numbers.length - i - 1; j++) {

                if (numbers[j] > numbers[j + 1]) {
                    int tmp = numbers[j + 1];
                    numbers[j + 1] = numbers[j];
                    numbers[j] = tmp;
                }
            }
        }

        return numbers;
    }

    public int[] sortNumbersUsingQuick(int start, int end) {

        if (start >= end) {
            return numbers;
        }

        int i = start - 1;
        int pivot = numbers[end];
        int tmp;

        for (int j = start; j < end; j++) {
            if (numbers[j] <= pivot) {
                tmp = numbers[++i];
                numbers[i] = numbers[j];
                numbers[j] = tmp;
            }
        }
        tmp = numbers[i + 1];
        numbers[i + 1] = numbers[end];
        numbers[end] = tmp;
        pivot = i + 1;

        sortNumbersUsingQuick(start, pivot - 1);
        sortNumbersUsingQuick(pivot + 1, end);

        return numbers;

    }

    public int[] sortNumbersUsingInsertion() {
        for (int i = 1; i < numbers.length; i++) {
            int target = numbers[i];

            int j = i - 1;
            while (j >= 0 && target < numbers[j]) {
                numbers[j + 1] = numbers[j];
                j--;
            }
            numbers[j + 1] = target;
        }

        return numbers;
    }
}