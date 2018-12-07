package crackbareel;

import java.util.ArrayList;
import java.util.Arrays;

public class Crackbareel {
    public static int counter = 0;
    public static int[][] moves
            = {
                {0, 1, 3},
                {0, 2, 5},
                {1, 3, 6},
                {1, 4, 8},
                {2, 4, 7},
                {2, 5, 9},
                {3, 6, 10},
                {3, 7, 12},
                {4, 7, 11},
                {4, 8, 13},
                {5, 8, 12},
                {5, 9, 14},
                {3, 4, 5},
                {6, 7, 8},
                {7, 8, 9},
                {10, 11, 12},
                {11, 12, 13},
                {12, 13, 14},};

    public static void main(String[] args) {
        go();
        
    }

    public static ArrayList<int[]> step() {
        ArrayList<int[]> steps = new ArrayList<>();
        for (int[] move : moves) {
            steps.add(move);
            int[] moveReversed = {move[2], move[1], move[0]};
            steps.add(moveReversed);
        }
        return steps;
    }

    public static int[] init(int i) {
        int[] cells = new int[16];
        cells[0] = 14;
        for (int j = 1; j < 16; j++) {
            cells[j] = 1;
        }
        cells[i+1] = 0;
        return cells;
    }

    public static int[] move(int[] kd, int[] fot) {
        int k = kd[0];
        int[] d = Arrays.copyOfRange(kd, 1, kd.length);
        int f = fot[0];
        int o = fot[1];
        int t = fot[2];
        if (d[f] == 1 && d[o] == 1 && d[t] == 0) {
            int[] c = Arrays.copyOfRange(d, 0, d.length);
            c[f] = 0;
            c[o] = 0;
            c[t] = 1;
            int[] r = new int[c.length + 1];
            r[0] = k - 1;
            for (int i = 1; i < r.length; i++) {
                r[i] = c[i - 1];
            }
            return r;
        }
        return null;
    }

    public static ArrayList<int[]> puzzle(int i) {
        int[] kd = init(i);
        ArrayList<ArrayList<int[]>> solv = solve(kd);
        ArrayList<int[]> sol = solv.get(counter++);
        
        ArrayList<int[]> ms = new ArrayList(sol.size() - 1);
        for (int j = 0; j < sol.size() - 1; j++) {
            ms.add(sol.get(j));
        }
        int[] newkd = sol.get(sol.size() - 1);
        ArrayList<int[]> mlist = new ArrayList<>();
        mlist.add(kd);
        while (!ms.isEmpty()) {
            int[] m = ms.get(0);
            ms.remove(0);
            mlist.add(m);
        }
        mlist.add(newkd);
        return mlist;
        

    }

    public static void show(int[] kd) {
        int k = kd[0];
        int[] d = Arrays.copyOfRange(kd, 1, kd.length);
        int[][] lines = {{4, 0, 0}, {3, 1, 2}, {2, 3, 5}, {1, 6, 9}, {0, 10, 14}};
        for (int[] line : lines) {
            int t = line[0];
            int a = line[1];
            int b = line[2];
            String tab = "";
            for (int j = 0; j < t; j++) {
                tab = tab + " ";
            }
            System.out.print(tab);
            for (int j = a; j < b + 1; j++) {
                String c = "";
                if (d[j] == 0) {
                    System.out.print(". ");
                } else {
                    System.out.print("x ");
                }
            }
            System.out.println("");
        }
        System.out.println("");

    }

    public static void replay(ArrayList<int[]> ms, int[] kd) {
        int[] kd2 = null;
        for (int[] m : ms) {
            show(kd);
            int k = kd[0];
            int[] d = Arrays.copyOfRange(kd, 1, kd.length);
            int f = m[0];
            int o = m[1];
            int t = m[2];
            d[f] = 0;
            d[o] = 0;
            d[t] = 1;

            kd2 = new int[d.length + 1];
            kd2[0] = k - 1;
            System.arraycopy(d, 0, kd2, 1, d.length);
        }
        show(kd2);
    }

    public static void terse() {
        for (int i = 0; i < 5; i++) {
            ArrayList<int[]> puz = puzzle(i);
            int kd1[] = puz.get(0);
            for (int j : kd1) {
                System.out.print(j + " ");
            }
            System.out.println("");
            ArrayList<int[]> ms = new ArrayList<>();
            for (int j = 1; j < puz.size() - 1; j++) {
                ms.add(puz.get(j));
            }
            for (int[] m : ms) {
                for (int j : m) {
                    System.out.print(j + " ");
                }
                System.out.println("");
            }
            int[] kd2 = puz.get(puz.size() - 1);
            for (int j : kd2) {
                System.out.print(j + " ");
            }
            System.out.println("\n");
        }
    }

    public static void go() {
        for (int i = 0; i < 5; i++) {
            System.out.println("===" + i + "===");
            ArrayList<int[]> puz = puzzle(i);
            int kd1[] = puz.get(0);
            ArrayList<int[]> ms = new ArrayList<>();
            for (int j = 1; j < puz.size() - 1; j++) {
                ms.add(puz.get(j));
            }
            int[] kd2 = puz.get(puz.size() - 1);
            
            replay(ms, kd1);
            
            System.out.println("");
        }
    }

    private static ArrayList<ArrayList<int[]>> solve(int[] kd) {
        ArrayList<ArrayList<int[]>> res = new ArrayList<>();
        int k = kd[0];
        if (k < 2) {
            ArrayList<int[]> finalSolve = new ArrayList<>();
            
            finalSolve.add(kd);
            res.add(0,finalSolve);
            return res;
        } else {
            ArrayList<int[]> steps = step();
            for (int[] m : steps) {
                int[] kc = move(kd, m);
                if (kc != null) {
                    ArrayList<ArrayList<int[]>> kcsolve = solve(kc);
                    for (ArrayList<int[]> r : kcsolve) {
                        ArrayList<int[]> ms = new ArrayList<>();
                        for (int i = 0; i < r.size() - 1; i++) {
                            ms.add(r.get(i));
                        }
                        int[] newkd = r.get(r.size() - 1);
                        ArrayList<int[]> tempSolve = new ArrayList<>();
                        tempSolve.add(m);
                        for (int[] m1 : ms) {
                            tempSolve.add(m1);
                        }
                        tempSolve.add(newkd);
                        res.add(tempSolve);
                    }
                }
            }
            return res;
        }

    }

}
