Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D97FF1E00F7
	for <lists+cocci@lfdr.de>; Sun, 24 May 2020 19:21:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04OHLTpD025875;
	Sun, 24 May 2020 19:21:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 887E87807;
	Sun, 24 May 2020 19:21:29 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D76B63D0F
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:21:27 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:444])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04OHLQtp000071
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:21:27 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id q8so7865826pfu.5
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 10:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5lFyZl5XeKOBmS16RYamVeIMNzwJ88ENJhpEcCtPHgM=;
 b=HOVkNI7jgtbjQj2MohJviiu0bsbEK6KaR7YK5tZ6rWp18VhJmq40VeLPodepATyG6D
 7kydKlvcVla0RSudr4mOM2gw5heTtErIzGpWld06tSOZTfLO1f5O7mQQoEkNN7agUPGB
 EiDBGuH1FDNE6+VTM7K7mG3mfIH5fQ7ghF1YaTOS675wiRVc08JVUp+1NA/5NVrUhmhK
 xGS2cQWTcb9BUU+kv86BZgmDe+6supyY8580ZdL/muiIlik1gStbgXPYgEcr0nOtzcIZ
 mfyQFGW/KaTceMSsCrT5Rha3USF19mHUCsPPcRb5PYIDntALryzxLDDU37Wkqj735/T2
 fd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5lFyZl5XeKOBmS16RYamVeIMNzwJ88ENJhpEcCtPHgM=;
 b=V0NvakVMXoY+P7xtcAUZqFZLq9iXgG4F2Yr08Ff4h1r9yDp/pvLDJV0l328KzsOpX7
 b3gZkxnL9kzJ5Dmni8bYDQ6INK3pxcM7SijHZUy6lCUmqEpWITirw+prVjFLgJnzcdon
 ZsEQfHu7r+FQeok3CWaQ3R0jg3A3h6zGcePhQhAVEBFNahZMTpRCOc8yfez0wxEm00Z5
 oS/pVnAkPldoVIYtuR6SdLCEZglEOuLrD46VK3as9A/M76+7HsMHdiFI5i/Yy4pjJo1d
 39srDFTONq2n0AWsxPjDNl5FP0X8wIh4UnjSKsbQXvsqrqxDYjrcpIsOF3EUvtmpHfmH
 bNkw==
X-Gm-Message-State: AOAM533MxbntF2RYEmPb1DBXFQvUh3AskExkdArskFo8bYv+fsBNVP6K
 otAhrniCaDQr/A5bParEZJx4N3/P1MU=
X-Google-Smtp-Source: ABdhPJy4GZSh8lKX2RcmYl2vTDxAqQpVSHaJQpxmBDceHimIm1dBI25Le5fMR7nTwHEjbzg+BQ3oOA==
X-Received: by 2002:a62:f242:: with SMTP id y2mr8291875pfl.111.1590340885525; 
 Sun, 24 May 2020 10:21:25 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:25 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:22 +0530
Message-Id: <20200524171935.2504-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 24 May 2020 19:21:29 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 24 May 2020 19:21:27 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 17/30] parsing_cocci: adjust_pragmas: Reflect
	Macrodecl attributes
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
adjust_pragmas.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/adjust_pragmas.ml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/parsing_cocci/adjust_pragmas.ml b/parsing_cocci/adjust_pragmas.ml
index 63038bca..e5597943 100644
--- a/parsing_cocci/adjust_pragmas.ml
+++ b/parsing_cocci/adjust_pragmas.ml
@@ -54,9 +54,9 @@ let rec right_decl d =
   | Ast0.FunProto(fninfo,id,lp1,params,va,rp1,sem) ->
       call_right right_mcode sem d
 	(function ty -> Ast0.FunProto(fninfo,id,lp1,params,va,rp1,sem))
-  | Ast0.MacroDecl(stg,name,lp,args,rp,sem) ->
+  | Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
       call_right right_mcode sem d
-	(function sem -> Ast0.MacroDecl(stg,name,lp,args,rp,sem))
+	(function sem -> Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem))
   | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
       call_right right_mcode sem d
 	(function sem -> Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem))
@@ -279,12 +279,12 @@ let rec left_decl decl =
 	  call_right left_mcode attr decl
 	    (function attr ->
 	      Ast0.FunProto((Ast0.FAttr attr)::x,name,lp1,params,va,rp1,sem)))
-  | Ast0.MacroDecl(Some stg,name,lp,args,rp,sem) ->
+  | Ast0.MacroDecl(Some stg,name,lp,args,rp,attr,sem) ->
       call_right left_mcode stg decl
-	(function stg -> Ast0.MacroDecl(Some stg,name,lp,args,rp,sem))
-  | Ast0.MacroDecl(None,name,lp,args,rp,sem) ->
+	(function stg -> Ast0.MacroDecl(Some stg,name,lp,args,rp,attr,sem))
+  | Ast0.MacroDecl(None,name,lp,args,rp,attr,sem) ->
       call_right left_ident name decl
-	(function name -> Ast0.MacroDecl(None,name,lp,args,rp,sem))
+	(function name -> Ast0.MacroDecl(None,name,lp,args,rp,attr,sem))
   | Ast0.MacroDeclInit(Some stg,name,lp,args,rp,eq,ini,sem) ->
       call_right left_mcode stg decl
 	(function stg ->
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
