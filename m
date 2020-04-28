Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 788C21BC60D
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:04:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SH3k2t010738;
	Tue, 28 Apr 2020 19:03:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BE897782D;
	Tue, 28 Apr 2020 19:03:46 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 731353DC8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:45 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:443])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SH3hod015348
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:44 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id 145so10952985pfw.13
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zbvXGqBiZFdhuruX6dixt1jqjEUEVpjkXq+JsBjijvw=;
 b=V6EMZavbBqv5glTnH95BbWCTWfaqULKey4KyoFRTD87T1F+E6vBIHPBmmrVK2yt7Oo
 4/X/3aINk3LUs8l5juSAraGGUGHYXHTuXkWxvxOhQ5FYtfhs5wp/PwdbV0aLCUkUkHfi
 aHJtSYAT3eDTfPoxsbW4pi5LBcZrrKP+Y+OYf3vO48U+E5sydP5BW8E9/LmGDpzD5yg6
 BUd57v8cDIjrlqVACgmd+WRwRbm4k1baTHmZPHSGu//YXKYjZMAWdeSU38wKhCP38PAO
 2k9JHZxoWTUFJ3e2ISpuKQxsx6e+YjXTBfol7klI+TdGMyarRSPzmBi4yVffMw76TX1D
 d2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zbvXGqBiZFdhuruX6dixt1jqjEUEVpjkXq+JsBjijvw=;
 b=ZEJPdX1LvX5Q9qgIbCXev6odE1JuC/osADv0TqM7l+u6Fbx9Em6fkonSajyrKJ4j5F
 43Hflgl3BSRN6K054xmH771oAJHzpwvWOpONInyezGYsbkW8SEwjsupfjd+3B6Ctw6lV
 r/tYhZdIEJ7/spO/5YV4ynR3pnlFX1CV8peqX/kIpo0xye3j5hapUTnsMpF5f13Lutlq
 AJBsnVd1/9E1mlj6nV0/aWQhnupCwbhSXzPblZL5sX/gta4QFbwtsgfWk1GYGm4sHerT
 XYMBU/DEqLALL5sDBlpjku70szBnGFBKLKzi5gT6WHsQ95mNA1ryUdcNap/cySuBHn8k
 SwEg==
X-Gm-Message-State: AGi0PuZVnhDMcoy83pPaKvststPgTy1m3oK3iiFut9pvT9bxmglPQzpT
 r6alKIVEOPLcgIEpyzTVnu8AA9R1klY=
X-Google-Smtp-Source: APiQypIfUdOcQB1ZxZMyUn4kjKqpBAY0AZvyfBqhV/+25YTS4EF+3709cNoDIKhVGf7ywwR+0dEOgw==
X-Received: by 2002:a05:6a00:2b4:: with SMTP id
 q20mr30708451pfs.104.1588093423046; 
 Tue, 28 Apr 2020 10:03:43 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:42 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:11 +0530
Message-Id: <20200428170228.7002-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:03:46 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 28 Apr 2020 19:03:45 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 15/32] parsing_cocci: visitor_ast: Visit cast
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

Cast attributes are added to AST0 of SmPL. Visit these attributes in the
SmPL AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast.ml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 8e530114..644bcd5d 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -198,12 +198,13 @@ let combiner bind option_default
 	  let lar = string_mcode ar in
 	  let lfield = ident field in
 	  multibind [lexp; lar; lfield]
-      | Ast.Cast(lp,ty,rp,exp) ->
+      | Ast.Cast(lp,ty,attr,rp,exp) ->
 	  let llp = string_mcode lp in
 	  let lty = fullType ty in
+	  let lattr = multibind (List.map string_mcode attr) in
 	  let lrp = string_mcode rp in
 	  let lexp = expression exp in
-	  multibind [llp; lty; lrp; lexp]
+          multibind [llp; lty; lattr; lrp; lexp]
       | Ast.SizeOfExpr(szf,exp) ->
 	  let lszf = string_mcode szf in
 	  let lexp = expression exp in
@@ -1184,12 +1185,13 @@ let rebuilder
 	    let lar = string_mcode ar in
 	    let lfield = ident field in
 	    Ast.RecordPtAccess(lexp, lar, lfield)
-	| Ast.Cast(lp,ty,rp,exp) ->
+	| Ast.Cast(lp,ty,attr,rp,exp) ->
 	    let llp = string_mcode lp in
 	    let lty = fullType ty in
+	    let lattr = List.map string_mcode attr in
 	    let lrp = string_mcode rp in
 	    let lexp = expression exp in
-	    Ast.Cast(llp, lty, lrp, lexp)
+	    Ast.Cast(llp, lty, lattr, lrp, lexp)
 	| Ast.SizeOfExpr(szf,exp) ->
 	    let lszf = string_mcode szf in
 	    let lexp = expression exp in
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
