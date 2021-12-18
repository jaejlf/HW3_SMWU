package Homework2.src;

interface Numbers {
    public int[] getNumbersArr();
    public int[] sortNumbersUsingBubble(int[] sorted);
    public int[] sortNumbersUsingQuick(int[] sorted, int start, int end);
    public int[] sortNumbersUsingInsertion(int[] sorted);
}

public class SortArr implements Numbers, Constant {

    public int[] getNumbersArr() {

        int nNumbers;
        String[] numbers_strType;
        int[] numbers;
        String input_numbers;

        System.out.print("The number of numbers : ");
        nNumbers = Integer.parseInt(scanner.next());
        scanner.nextLine();// 버퍼 비우기

        numbers_strType = new String[nNumbers];
        numbers = new int[nNumbers];

        System.out.print("Numbers : ");
        input_numbers = scanner.nextLine();
        numbers_strType = input_numbers.split(" ");

        for (int i = 0; i < numbers.length; i++) {
            numbers[i] = Integer.parseInt(numbers_strType[i]);
        }

        return numbers;
    }

    public int[] sortNumbersUsingBubble(int[] sorted) {

        for (int i = 0; i < sorted.length; i++) {
            for (int j = 0; j < sorted.length - i - 1; j++) {

                if (sorted[j] > sorted[j + 1]) {
                    int tmp = sorted[j + 1];
                    sorted[j + 1] = sorted[j];
                    sorted[j] = tmp;
                }
            }
        }

        return sorted;
    }

    public int[] sortNumbersUsingQuick(int[] sorted, int start, int end) {

        if (start >= end) {
            return sorted;
        }

        int i = start - 1;
        int pivot = sorted[end];
        int tmp;

        for (int j = start; j < end; j++) {
            if (sorted[j] <= pivot) {
                tmp = sorted[++i];
                sorted[i] = sorted[j];
                sorted[j] = tmp;
            }
        }
        tmp = sorted[i + 1];
        sorted[i + 1] = sorted[end];
        sorted[end] = tmp;
        pivot = i + 1;

        sortNumbersUsingQuick(sorted, start, pivot - 1);
        sortNumbersUsingQuick(sorted, pivot + 1, end);

        return sorted;

    }

    public int[] sortNumbersUsingInsertion(int[] sorted) {
        for (int i = 1; i < sorted.length; i++) {
            int target = sorted[i];

            int j = i - 1;
            while (j >= 0 && target < sorted[j]) {
                sorted[j + 1] = sorted[j];
                j--;
            }
            sorted[j + 1] = target;
        }

        return sorted;
    }
}