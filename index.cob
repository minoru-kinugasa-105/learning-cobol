       IDENTIFICATION DIVISION.
       PROGRAM-ID. 銀行システム.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 口座残高            PIC 9(9) VALUE 0.
       01 ユーザー選択          PIC 9 VALUE 0.
       01 取引金額            PIC 9(9).
       01 終了フラグ           PIC X VALUE 'N'.

       PROCEDURE DIVISION.

       メイン手続き.
           PERFORM UNTIL 終了フラグ = 'Y'
               DISPLAY '--- 銀行システム ---'
               DISPLAY '1. 預金'
               DISPLAY '2. 引き出し'
               DISPLAY '3. 残高照会'
               DISPLAY '4. 終了'
               ACCEPT ユーザー選択

               EVALUATE ユーザー選択
                   WHEN 1
                       PERFORM 預金手続き
                   WHEN 2
                       PERFORM 引き出し手続き
                   WHEN 3
                       PERFORM 残高照会手続き
                   WHEN 4
                       MOVE 'Y' TO 終了フラグ
                   WHEN OTHER
                       DISPLAY '無効な選択です。もう一度選んでください。'
               END-EVALUATE
           END-PERFORM.

           DISPLAY 'ご利用ありがとうございました。'.
           STOP RUN.

       預金手続き.
           DISPLAY '預金額を入力してください: '
           ACCEPT 取引金額
           ADD 取引金額 TO 口座残高
           DISPLAY '預金が完了しました。'.

       引き出し手続き.
           DISPLAY '引き出し額を入力してください: '
           ACCEPT 取引金額
           IF 取引金額 > 口座残高
               DISPLAY '残高が不足しています。'
           ELSE
               SUBTRACT 取引金額 FROM 口座残高
               DISPLAY '引き出しが完了しました。'
           END-IF.

       残高照会手続き.
           DISPLAY '現在の残高は: ' 口座残高 '円です。'.