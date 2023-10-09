package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Winner {
    private int wno;
    private int eno;
    private String title;
    private String content;
    private String author;
    private String resdate;
}
