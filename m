Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D86C1E7CA8
	for <lists+cocci@lfdr.de>; Fri, 29 May 2020 14:09:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04TC8xYx012551;
	Fri, 29 May 2020 14:08:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 401ED5D47;
	Fri, 29 May 2020 14:08:59 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D9B4A5D47
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:08:56 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:443])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04TC8tkb016140
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:08:56 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id g5so1275954pfm.10
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBrn5GOGua0oqimGk46kFDdn4o25pJeN4ksGfT7ihn4=;
 b=ZllWuOHxGUcwFEvx8Io4wEhtcHOA/kw17iK+g0FtrPOT2U8Fv4nS8Rz/WpaljGJjmr
 DB6kVJWi38TqZMGj2cHujNk9GsAnKEOR/Z15QYeQ9k8sp+/yJwYbAo9frHz15H6KRcIH
 uzLCQ3w4Cp5+bHjpxYMGM/czmJdY/DZp04DlgwIp4cHxpgUBbP6A9V0TIEY9WXmco4R1
 xyR+Nl9Lwt/RO/DfzUw+zrhGIKvB8vRO0HuReLSB/f6yOCEDTUwfdr4gYsLBdYed0of3
 QEXK9ea5sqGzX0w2nJWXGMLf2dmYzmWDFLCcFUqMPnXeU6CNx5YNv9QBCt1+LIZbjTFD
 unkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBrn5GOGua0oqimGk46kFDdn4o25pJeN4ksGfT7ihn4=;
 b=Dv2gPleYILWMS4hOd2kos5aivYgNA1qR0Py1rEfa4iyyNLLHAGddEkyUKd+mNFgOYP
 e/cxLhKttZyDwHTTS55C1JPs5svVoyG1y7ncOepI4V+h4XfLJA3t+aovnqhcx/PLGDsO
 UM8jkncV6Vw2VDXj8vogC5dFrNj7b7hUer0UnbbWwsUMOm4ZZN9xJM5VAdgYNPHq5HL7
 ZnsN0CQpHTX3r9g1aqf5bsCAScOJjvrBlBtTg9F/PoV8VLFc7tLhpppsMsMax54+39Vj
 rvw87nCA4jjBXYZAAH3pVKdHsaxYZA7ChFWlSiRiiLwddSzkFG1vOIWLlBb41vlnQ1ui
 KMTA==
X-Gm-Message-State: AOAM531M2QDXzMfwrXhk9U74oRN+9kyzkcI87PZ0eL4OKKRVM7mg/Fqe
 JyVuYJnR/VwN4rBkYKrQIm/W3iJM
X-Google-Smtp-Source: ABdhPJyEq7hlsNLmOP0Dhk7j0w11w1GSkhlaG/JPz15yjRJqtZ+Dm4L8O5TxHb0JaFdS9IA4RxhgXg==
X-Received: by 2002:a62:b402:: with SMTP id h2mr8690566pfn.221.1590754134440; 
 Fri, 29 May 2020 05:08:54 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:08:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:39 +0530
Message-Id: <20200529120703.31145-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 May 2020 14:08:59 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 29 May 2020 14:08:56 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 09/32] parsing_cocci: arity: Reflect Cast
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
arity.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/arity.ml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index 0f64c113..90d0cd98 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -254,13 +254,15 @@ let rec top_expression opt_allowed tgt expr =
       let ar = mcode ar in
       let field = ident false arity field in
       make_exp expr tgt arity (Ast0.RecordPtAccess(exp,ar,field))
-  | Ast0.Cast(lp,ty,rp,exp) ->
-      let arity = exp_same (mcode2line lp) [mcode2arity lp;mcode2arity rp] in
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
+      let arity =
+        exp_same (mcode2line lp) (List.map mcode2arity ([lp] @ attr @ [rp])) in
       let lp = mcode lp in
       let ty = typeC arity ty in
+      let attr = List.map mcode attr in
       let rp = mcode rp in
       let exp = expression arity exp in
-      make_exp expr tgt arity (Ast0.Cast(lp,ty,rp,exp))
+      make_exp expr tgt arity (Ast0.Cast(lp,ty,attr,rp,exp))
   | Ast0.SizeOfExpr(szf,exp) ->
       let arity = exp_same (mcode2line szf) [mcode2arity szf] in
       let szf = mcode szf in
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
