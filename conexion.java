package finalproject;
//Prueba de conexion

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

  

    public class Conexion extends JFrame {

        public Connection cnx;
        public ResultSet rs;
        public PreparedStatement ps;
        JLabel lbl;
        JButton btn;

        Conexion() {
            this.setExtendedState(JFrame.MAXIMIZED_BOTH);
            this.setBounds(150, 50, 800, 600);
            this.setDefaultCloseOperation(EXIT_ON_CLOSE);
            this.setResizable(true);
            this.setLayout(null);

            this.lbl = new JLabel("Press to connect");
            this.lbl.setBounds(150, 150, 150, 150);

            this.btn = new JButton("connect");
            this.btn.setBounds(300, 150, 150, 150);
            this.btn.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    Conectar();
                }
            });

            this.add(btn);
            this.add(lbl);
            this.setVisible(true);
        }

        public void Conectar() {
            try {
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/proyecto", "root", "");
                System.out.println("Conexión exitosa");
            } catch (SQLException e) {
                System.out.println("Error de conexión");
            }
        }
    
        public static void main(String[] args) {
        new Conexion();
    }
    }
