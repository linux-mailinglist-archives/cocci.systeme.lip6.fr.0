Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB56E186890
	for <lists+cocci@lfdr.de>; Mon, 16 Mar 2020 11:04:59 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02GA3xGW012494;
	Mon, 16 Mar 2020 11:03:59 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A0F967802;
	Mon, 16 Mar 2020 11:03:59 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D71907802
 for <cocci@systeme.lip6.fr>; Mon, 16 Mar 2020 11:03:57 +0100 (CET)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:643])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02GA3u5o013097
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 16 Mar 2020 11:03:57 +0100 (CET)
Received: by mail-pl1-x643.google.com with SMTP id d9so7764504plo.11
 for <cocci@systeme.lip6.fr>; Mon, 16 Mar 2020 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kBHYkDGQlRSJMHZTompYxXUA2EEsAkfNRX4sdP02jHM=;
 b=Rl52bgYGwj6fvBrSOvMK/9sZMWhY1fMQrRKBX39UtLFBN9iJnwkULzkY3leHDJ+jo+
 X11fgWNsT2Y4WxlEYla7JoQrHCMY3wHQGuS2YeTHWaYDeZ17e1TdlqhTaFuKTciGSQ+W
 wfdzdOpTuuE4VTkRZ1urcfvnptjWe1RUEIWj8M9KHjPZnTva9UL3KQ8MfkrxDxpJk2Gx
 AgDnYJbtsJprAR1SPeyuoeiZLckFKzqVSP4zHM235C4+Dahk4DuQ0+cIvdyt8ljsCYVq
 vKT/qQRNJUM9zr3QWdPpS+M0/nUbxEuqg8gib53VNvrvVy62DiBpkd8PPvjDR3ofzW/W
 NCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kBHYkDGQlRSJMHZTompYxXUA2EEsAkfNRX4sdP02jHM=;
 b=tq89lJRrS14252+YRiu+0JEzr+6JYb7YnR/xHWgQtVL/7CXKNax5V3KvtdD2uvnZY0
 VXFcC33NR0X3e18RE/nnsVKaRc8HdBMehmZ6HeM8h+AAABDdDMOnHRxgB/U6yrQ4eELH
 ph/2kdWfTS0g1HFNijWt80Kww6Qv+zoPQb9XcQ1ZqHC1+iD5gJOZ/F+QKaihzGC8Yz38
 bCr2cjxCAizDQR5sC1cNEqs6esOcrGLmGJY+anBjIeoh8ad7nrpMAhKRZPX+g6XH+bJu
 QIlPn/8537KUFLfLXBRvqANtB/GxLxsiqEa8GmrZ+a6tpczq+qi3gyPTqYYdkL1wuL5F
 1FRA==
X-Gm-Message-State: ANhLgQ2EyeiSpLa6LyqdoY+Q4FA+yP52UL5ACbpTrSm0t65RXLgUOFrn
 oxFPfwCuxUFdCHJCAOk7JpqKgWMY
X-Google-Smtp-Source: ADFU+vs+yTHAdIO8jA4GylbcYLWqTZxNTloNahGOTNyLK6tC8BQlUvraetcK/whtg9rOSqselypbOA==
X-Received: by 2002:a17:902:8303:: with SMTP id
 bd3mr26653199plb.171.1584353035475; 
 Mon, 16 Mar 2020 03:03:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:03:55 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:00 +0530
Message-Id: <20200316100319.27935-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 16 Mar 2020 11:03:59 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 16 Mar 2020 11:03:57 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 07/26] parsing_cocci: index: Add cases for
	ParenType/FunctionType
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

ParenType and FunctionType are now added to the SmPL ASTs. Add
cases for these types in index.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/index.ml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/parsing_cocci/index.ml b/parsing_cocci/index.ml
index a1103503..5c91f620 100644
--- a/parsing_cocci/index.ml
+++ b/parsing_cocci/index.ml
@@ -93,6 +93,8 @@ let typeC t =
   | Ast0.Signed(sign,ty) -> [129]
   | Ast0.Pointer(ty,star) -> [49]
   | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) -> [131]
+  | Ast0.ParenType(lp,ty,rp) -> [138]
+  | Ast0.FunctionType(ty,lp,params,rp) -> [139]
   | Ast0.Array(ty,lb,size,rb) -> [50]
   | Ast0.Decimal(dec,lp,length,comma,precision_opt,rp) -> [160]
   | Ast0.EnumName(kind,name) -> [146]
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
