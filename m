Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 718A01CD5EF
	for <lists+cocci@lfdr.de>; Mon, 11 May 2020 12:08:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04BA87pQ021876;
	Mon, 11 May 2020 12:08:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 29802782B;
	Mon, 11 May 2020 12:08:07 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D720F3DC8
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:08:04 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:643])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04BA83g1013016
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:08:04 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id b8so3733267plm.11
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 03:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=baLXxpVeWEBfxtTo4sAaWBj7RQkMl3/SHWSBubRN2Uk=;
 b=f+52gxoEYvT8HUHr6aZjAiX2HfZf8dZJ/kjPkvW2sTrfgf/qaZkQl/POEMkj8SzSAX
 iCOf3cBOGT+pwvHjeABmwKIh6Nu1IUptMCGN4qgCCWRxaswEapkp1zntsNi7+Bbcfs5i
 +ZeF7adMSifqZxso7sP5OBIvf6YUF/ARcK03pbXidy9boPjtUk3Ai0U3Enil+iBo/qJ2
 watLsbbvryL6hXgfXggdaxGjRESmX2MjMB1SoGeOwcXsZ8syr4Sffm1gYpkjseG8XMs0
 0AF834o4GTVAp7Fm9wMdq696yE+gW3BHvlaVzjwP+57hotT7JIGAazMdhFck45GBRXfT
 7HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=baLXxpVeWEBfxtTo4sAaWBj7RQkMl3/SHWSBubRN2Uk=;
 b=iUaOGNHyblLfp2TT4EaYgSBa0obGQBNVLgKvI0v7JycQo/2Vb3HIeSbljFHxbgFeuA
 t8fOYgd2tbPIl7xQEictP0KJ5hJVb4mus35u1KdzrWtgqlv/FPKcVz3Xsegck1l0/uXP
 2c+blfIraxNg0IzM5DcQBXnJwG0nTEcI16bPjsVPEm6UkdTNDzoWBeb/XxsturJEEsds
 rXsCprM/n4488ttz2hgvg5ukEqElNR9Nzzw/bGdmOsxGmw6NvffhuYZxiLJQiV/Kji83
 2zcLIPM0+7MLaagx+mtrtVqznLYkrzs6T6qbOiKYiXRddYjLXwIu0md7xunBv9yZqk3+
 YY0Q==
X-Gm-Message-State: AGi0PuZeMgBgZ3NN0CzEi6c6e5qMJACMpJ7KG+42h70rVbktuq4htWRW
 EhEZxEwQq1hyKGjETP6to0+dTywKQcA=
X-Google-Smtp-Source: APiQypIZv43dAv84R2THSBWcBO0ZHEcWm5cXH8bxs3tdYG4GEr6up4qn2ONh9+OcaNkRsZB/FiMZHQ==
X-Received: by 2002:a17:90b:19c9:: with SMTP id
 nm9mr22047232pjb.86.1589191682329; 
 Mon, 11 May 2020 03:08:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:02 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:50 +0530
Message-Id: <20200511100715.19819-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 11 May 2020 12:08:07 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 11 May 2020 12:08:04 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v2 07/32] parsing_cocci: iso_pattern: Reflect Cast
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

Cast attributes are added to the SmPL AST. Reflect these changes in
iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/iso_pattern.ml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 9df21fb9..b57e293e 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -575,7 +575,7 @@ let match_maker checks_needed context_required whencode_allowed =
 			(* all caps is a const *)
 			Str.string_match all_caps nm 0
 		    | _ -> false)
-		| Ast0.Cast(lp,ty,rp,e) -> matches e
+		| Ast0.Cast(lp,ty,attr,rp,e) -> matches e
 		| Ast0.SizeOfExpr(se,exp) -> true
 		| Ast0.SizeOfType(se,lp,ty,rp) -> true
 		| Ast0.MetaExpr(nm,_,_,Ast.CONST,p,_bitfield) ->
@@ -586,7 +586,7 @@ let match_maker checks_needed context_required whencode_allowed =
 	      let rec matches e =
 		match Ast0.unwrap e with
 		  Ast0.Ident(c) -> true
-		| Ast0.Cast(lp,ty,rp,e) -> matches e
+		| Ast0.Cast(lp,ty,attr,rp,e) -> matches e
 		| Ast0.MetaExpr(nm,_,_,Ast.ID,p,_bitfield) ->
 		    (Ast0.lub_pure p pure) = pure
 		| _ -> false in
@@ -757,10 +757,16 @@ let match_maker checks_needed context_required whencode_allowed =
 	       conjunct_many_bindings
 		 [check_mcode opa op; match_expr expa expb;
 		   match_ident fielda fieldb]
-	  | (Ast0.Cast(lp1,tya,rp1,expa),Ast0.Cast(lp,tyb,rp,expb)) ->
+	  | (Ast0.Cast(lp1,tya,attra,rp1,expa),
+             Ast0.Cast(lp,tyb,attrb,rp,expb)) ->
+              if (List.length attra = List.length attrb &&
+                  List.fold_left2 (fun p a b -> p && mcode_equal a b) true
+                  attra attrb)
+              then
 	      conjunct_many_bindings
 		[check_mcode lp1 lp; check_mcode rp1 rp;
 		  match_typeC tya tyb; match_expr expa expb]
+              else return false
 	  | (Ast0.SizeOfExpr(szf1,expa),Ast0.SizeOfExpr(szf,expb)) ->
 	      conjunct_bindings (check_mcode szf1 szf) (match_expr expa expb)
 	  | (Ast0.SizeOfType(szf1,lp1,tya,rp1),
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
