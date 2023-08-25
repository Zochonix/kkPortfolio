/*
 * This is the main class for the Xenalysio application, written entirely in the Java programming language. It controls all other instances.
 * 
 * Author: Kane Kennedy
 * Last Modified: 26/05/23
 * 
 */

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.ImageIcon;

public class Xenalysio {

    JFrame applicationFrame;
    JPanel applicationController;
    public static void main(String[] args) {

        Xenalysio application = new Xenalysio();
        application.setFocus();
        application.setParameters();
        application.launch();

    }
 
    private Xenalysio() {

        applicationFrame = new JFrame("Xenalysio");
        applicationController = new Controller();

    }

    private void setFocus() {

        applicationController.setFocusable(true);
        applicationController.requestFocusInWindow();

    }

    private void setParameters() {

        ImageIcon img = new ImageIcon("graphics/Submarine/Submarine_64.png");
        applicationFrame.setIconImage(img.getImage());
        applicationFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        applicationFrame.add(applicationController);
        applicationFrame.pack();
        applicationFrame.setLocationRelativeTo(null);
        applicationFrame.setResizable(false);

    }

    private void launch() {

        applicationFrame.setVisible(true);

    }

}