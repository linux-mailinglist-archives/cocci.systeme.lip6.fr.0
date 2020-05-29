Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF531E7CAB
	for <lists+cocci@lfdr.de>; Fri, 29 May 2020 14:09:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04TC97fH017472;
	Fri, 29 May 2020 14:09:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2C2BE5D47;
	Fri, 29 May 2020 14:09:07 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5D9DC5D47
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:05 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:543])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04TC93PT010060
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:04 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id f21so1392701pgg.12
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 05:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=czkNgC7mHrVkpHFh8w/m1Lw+qJX/QBELh3ArVedEAQ8=;
 b=WCcKEUxv4R6etWVSEryxZlOgmizrjiCdQeHPc/G4f0M9byHeN8JFku4gq0eS7VtKZO
 Kv4TzUc5rwy7xtHPZFF4RXvA26l1Hg+n0r0wIIE7xC5Po7AXmAduiuVj31KdODM33eRN
 2OjxEDvBXp4FTpuou2E9dAREDxd9wQqIDb9ASC5Aeno/vtLvN9C/b/zt3Dz98SrjOoBK
 scUR4gY2omNPlJX0I//Ujv6yCclrGZ/6D5qhmAverFTGwpvOSTtjg/CW9RiT+NZHe4e4
 a1XTACkWhTBOgprdSVl4V1SHitFLqKQhGrPzrPW2CRjaVJIIQCZQIEFV6IxwWRYWHAxs
 QzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czkNgC7mHrVkpHFh8w/m1Lw+qJX/QBELh3ArVedEAQ8=;
 b=Sxo0PHRKrkyrU2hBjt2Q5wS1nTnnGOrz8VsAgqNF796hRY7cB+jE5VnJCOX6P5gU8X
 gX3o4nxxrwT/T65pJw5ySKTdoepHvb+pQ72HxnZcN4490ejbI2OLuaXJreVYN8qe5WMl
 EmJ2lNIGzE9225+Q+PV43bOMlKePOTMCnxKOqoxYVlKJzTFxLfX1jMizWjLvs9HSLGoi
 39cqyHQbS71dsVQUJRRCuwJNLv+vSC1o9j4ryoA8Km+Dgt5WbvBd51uDjMo/FqL1O0oX
 rGu+5LS4t+vB1dsTSMEOBbFU8znwwhGdY6tHAmCN95l4kSg/i+8FW8cNPh0yRsnv9+kO
 wK6A==
X-Gm-Message-State: AOAM532wpNQaJiWNspMoOyvXyQjrAlFYt8qNftLMKXO5Y3eX37cj29Kv
 uZdehP603fWjuBjy2lTmFoLvS1T9
X-Google-Smtp-Source: ABdhPJyqFY20odkcdEQYk9rV3z52QKVuP5XLSAlnHaCo8MCwMJDhlykek8FoCM6IgHiKFfMr7yZ4nw==
X-Received: by 2002:a65:67d6:: with SMTP id b22mr8064885pgs.14.1590754142940; 
 Fri, 29 May 2020 05:09:02 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:02 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:41 +0530
Message-Id: <20200529120703.31145-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 May 2020 14:09:07 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 29 May 2020 14:09:04 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 11/32] parsing_cocci: compute_lines: Reflect Cast
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
compute_lines.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/compute_lines.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
index 5c739d8b..99029212 100644
--- a/parsing_cocci/compute_lines.ml
+++ b/parsing_cocci/compute_lines.ml
@@ -425,11 +425,12 @@ let rec expression e =
       let ar = normal_mcode ar in
       let field = ident field in
       mkres e (Ast0.RecordPtAccess(exp,ar,field)) exp field
-  | Ast0.Cast(lp,ty,rp,exp) ->
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
       let lp = normal_mcode lp in
       let exp = expression exp in
+      let attr = List.map normal_mcode attr in
       let rp = normal_mcode rp in
-      mkres e (Ast0.Cast(lp,typeC ty,rp,exp)) (promote_mcode lp) exp
+      mkres e (Ast0.Cast(lp,typeC ty,attr,rp,exp)) (promote_mcode lp) exp
   | Ast0.SizeOfExpr(szf,exp) ->
       let szf = normal_mcode szf in
       let exp = expression exp in
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
