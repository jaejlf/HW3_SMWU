package Homework2.src;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class SortArrTest {
	SortArr num = new SortArr();
	int[] testArr = {1, 9, 3, 7, 8, 5, 2, 4, -6, -1};
	int[] answerArr = {-6, -1, 1, 2, 3, 4, 5, 7, 8, 9};
	
	@Test
	void testSortNumbersUsingBubble() {
		assertArrayEquals(num.sortNumbersUsingBubble(testArr), answerArr);
	}

	@Test
	void testSortNumbersUsingQuick() {
		assertArrayEquals(num.sortNumbersUsingQuick(testArr, 0, 9), answerArr);
	}

	@Test
	void testSortNumbersUsingInsertion() {
		assertArrayEquals(num.sortNumbersUsingInsertion(testArr), answerArr);
	}

}
