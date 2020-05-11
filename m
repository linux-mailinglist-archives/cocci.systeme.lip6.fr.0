Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40A1CD607
	for <lists+cocci@lfdr.de>; Mon, 11 May 2020 12:10:09 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04BA97AE024023;
	Mon, 11 May 2020 12:09:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5813C782B;
	Mon, 11 May 2020 12:09:07 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id BE26E3DC8
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:09:05 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:641])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04BA94Vf024608
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:09:05 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id b8so3734140plm.11
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 03:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tn9edAsW1urCa0RXAKnfsOWITWdzvvWWDpT5zU7AZJA=;
 b=g8O5CTm5oAUlHGo1vUcdXS97l40z3DmnqGVu45l9YeUbp3hmz1CKayQeje+Ps4KFdZ
 YGfwaSPzsrt3gsVpF6pzwlZWktrEQcGlD78hiOBlIC7AWbOhNExn20JOahnC6ySkmqG0
 s4C33VzAWz4xbOrw8PmWJVWGd1X4Gc/WgXJFSPro9g3zomJ9X6cVgolDYasTB44d002n
 yZcBPjLdPpAWZNU4zyMaDjwN8M3SOELf109lV7urjo9+G1nWPZyFNX4343gc/bySbqOw
 vGsnmuXE7eSPwk71KM+7x+vD+hiagA6H3FIxM/SZxrd6XX22yvQsBn0ydfVB1joq41tn
 g7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tn9edAsW1urCa0RXAKnfsOWITWdzvvWWDpT5zU7AZJA=;
 b=srME2IOJ99lyQuh6169nbR+8lM89KirEpS686p/GHa10adOeNpEqfJcaUxwNvToHEl
 0PfGILNOMYDJ4VHyWFN54pZRRuVD7OzFPHqq1HwED0uJ3X6YKA97COXSKv3kXOHJhfnN
 ajRyn/oU33PnnABF07l9+KaCo/oJrhfHIQVlasJUSsx24u2q0qrwFccOFrT8pylgy0Ab
 1JYLwUe1uljDX8NfWKqe3Wp44kuIbTTEwW2x/4qV+ins9SB4t/AS9hOE3hkBbqmCvtCk
 etUwL5zJAL33VOQSRZe3AIJBu+nO+rWtaQlUWNmX70afsk6il5Rh33SOavuzbAJzNSLl
 0e/Q==
X-Gm-Message-State: AGi0PuZhE2hTdF+KWoKsk9S/A2UKPrH5Jn7yWjNszO6AeXqKgQVW/3AR
 nfKPLEjsgO3OIFbt5zqJuV5Q+ucGcpg=
X-Google-Smtp-Source: APiQypIpkKwC38Q+YSAON//qf+kPnCwjI6WyDSmpJR2uqaWE4dtH7tZsYWZkK5DNiEg9IPSdYp3wSw==
X-Received: by 2002:a17:90a:d312:: with SMTP id
 p18mr20612736pju.200.1589191743346; 
 Mon, 11 May 2020 03:09:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:02 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:05 +0530
Message-Id: <20200511100715.19819-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 11 May 2020 12:09:07 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 11 May 2020 12:09:05 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v2 22/32] parsing_c: pretty_print_c: Reflect Cast
	attributes
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

Cast attributes are added to the SmPL AST. Print these attributes in
pretty_print_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/pretty_print_c.ml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
index 99a7e0ed..6e9a418e 100644
--- a/parsing_c/pretty_print_c.ml
+++ b/parsing_c/pretty_print_c.ml
@@ -146,8 +146,9 @@ let mk_pretty_printers
 	pp_expression e
     | SizeOfType  (t),     [i1;i2;i3] ->
         pr_elem i1; pr_elem i2; pp_type t; pr_elem i3
-    | Cast    (t, e),      [i1;i2] ->
-        pr_elem i1; pp_type t; pr_elem i2; pp_expression e
+    | Cast    (t, a, e),   [i1;i2] ->
+        pr_elem i1; pp_type t; a +> pp_attributes pr_elem pr_space;
+        pr_elem i2; pp_expression e;
 
     | StatementExpr (statxs, [ii1;ii2]),  [i1;i2] ->
         pr_elem i1;
@@ -184,7 +185,7 @@ let mk_pretty_printers
     | CondExpr (_,_,_) | Sequence (_,_) | Assignment (_,_,_)
     | Postfix (_,_) | Infix (_,_) | Unary (_,_) | Binary (_,_,_)
     | ArrayAccess (_,_) | RecordAccess (_,_) | RecordPtAccess (_,_)
-    | SizeOfExpr (_) | SizeOfType (_) | Cast (_,_)
+    | SizeOfExpr (_) | SizeOfType (_) | Cast (_,_,_)
     | StatementExpr (_) | Constructor _
     | ParenExpr (_) | New (_) | Delete (_,_)
     | Defined (_)),_ -> raise (Impossible 95)
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
