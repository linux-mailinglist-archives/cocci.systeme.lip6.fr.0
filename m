Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E211B709B
	for <lists+cocci@lfdr.de>; Fri, 24 Apr 2020 11:20:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03O9JrJ2027389;
	Fri, 24 Apr 2020 11:19:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 50913782E;
	Fri, 24 Apr 2020 11:19:53 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 363377815
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 11:19:51 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:543])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03O9Jn3C013147
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 11:19:50 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id o10so4362661pgb.6
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 02:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tg8TivWc/r8jtttAIWUADKtf5xjAapRVbCp7eqUmDZg=;
 b=cr036kb7+dj1kGPnNMn1pw2kAY+Jf3MCdzgNxOZLkTu8ILKaxgUlSToKp4+86g22H2
 wR24CzQqyh/VCESeJ3VdynuWf8zbl8JvwhcKYvaaX4lRhYIGq2cBr40lt2pUioYJ5xFC
 SJUD6rcimvKXUEfRDTpB8odZpZ8nwdR5tGyyW6gU2QAmATGYU2ysoGp3I3jT8kXjkrlh
 hJ+5W6dRVMZSJyTBbtUyutO735oASS6D2XOWAoDO2woY6IpNeO/jE7R4xQ5YQ3duD5Y0
 29l9rC/NJkatK/HZkkq5GxZijxzUSR9m+2IPoJhzftPsv+FHwdZErYOj4n+icRfJ6yki
 GJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tg8TivWc/r8jtttAIWUADKtf5xjAapRVbCp7eqUmDZg=;
 b=WTcPgPS3LtXIQx1pyHrz+0HwMJfWzardV5J8CMPM9iWNN2JZrHe4eP9P9r9ovEE4Nl
 UuW/GuzMy0VApsZg3wnZkGsJkLtsrc5SNC74AIPq/pUd7KpdF2MDu7Sk7nBWbvuMZReW
 iDRBRZ6wRIxZeWrOuyUzB1Ae/Dc1TZZf+n6M3D+ZSRbyeLk7RMDET1d669wKUqelVezV
 QvpFaC/vorSv2f1LxSHTrbrYOJor0jjPdXLed1LqPckMrA5txXN/SliYeBZjaPrzykxU
 SHbNZqezcaDuuHNlFiZUFSp1dZ8kwjUsyx8enJtNENV1kxzwMoCxilzrk8KHPGez/nMf
 AwUA==
X-Gm-Message-State: AGi0PuYgRYTbczSVVt2tEc5J9/jV/C5UOSfVpMy2YvahO+3Iyr4iaE85
 2sRXXFxe235j7fDgo5Qz3Xnhb46nsyQ=
X-Google-Smtp-Source: APiQypJ5ziW/ZyiXo/Eug9f4zByFPVbtjIh+G4M6CjjBGM6I73cdWNF50d/GmXn+S2IoS2XRa+46Sg==
X-Received: by 2002:a63:6a84:: with SMTP id f126mr8244943pgc.14.1587719988766; 
 Fri, 24 Apr 2020 02:19:48 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:48 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:57 +0530
Message-Id: <20200424091801.13871-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 24 Apr 2020 11:19:53 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 24 Apr 2020 11:19:50 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [RFC PATCH 21/25] parsing_c: visitor_c: Visit parameter
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

As attributes are added to the parameter type, have the C AST visitor
visit these attributes as well.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/visitor_c.ml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/parsing_c/visitor_c.ml b/parsing_c/visitor_c.ml
index aaef1acc..57b5f32b 100644
--- a/parsing_c/visitor_c.ml
+++ b/parsing_c/visitor_c.ml
@@ -1929,10 +1929,15 @@ and vk_node_s = fun bigf node ->
 (* ------------------------------------------------------------------------ *)
 and vk_param_s = fun bigf param ->
   let iif ii = vk_ii_s bigf ii in
-  let {p_namei = swrapopt; p_register = (b, iib); p_type=ft} = param in
+  let
+    {p_namei = swrapopt;
+     p_register = (b, iib);
+     p_type=ft;
+     p_attr = attrs} = param in
   { p_namei = swrapopt +> Common.map_option (vk_name_s bigf);
     p_register = (b, iif iib);
     p_type = vk_type_s bigf ft;
+    p_attr = attrs +> List.map (vk_attribute_s bigf);
   }
 
 let vk_arguments_s = fun bigf args ->
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
