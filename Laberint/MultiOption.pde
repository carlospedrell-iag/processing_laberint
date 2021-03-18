import javax.swing.*;
public class MultiOption {
   public int[] askInfo() {
     int[] values = {0,0};
     
      JTextField xField = new JTextField("5");
      JTextField yField = new JTextField("10");

      JPanel myPanel = new JPanel();
      myPanel.add(new JLabel("Columnes:"));
      myPanel.add(xField);
      myPanel.add(Box.createHorizontalStrut(15)); // a spacer
      myPanel.add(new JLabel("Files:"));
      myPanel.add(yField);

      int result = JOptionPane.showConfirmDialog(null, myPanel, 
               "Introdueix nombre de columnes i files", JOptionPane.OK_CANCEL_OPTION);
      if (result == JOptionPane.OK_OPTION) {
          values[1] = parseInt(xField.getText());
          values[0] = parseInt(yField.getText());
         //System.out.println("x value: " + xField.getText());
         //System.out.println("y value: " + yField.getText());
         return values;

      }
      else{
        exit();
        return null;
      }
   }
}
