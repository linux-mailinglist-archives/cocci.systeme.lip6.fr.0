Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E51BC614
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:04:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SH3x9H028435;
	Tue, 28 Apr 2020 19:03:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4E27D782D;
	Tue, 28 Apr 2020 19:03:59 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9D64B3DC8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:57 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1041])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SH3trV015878
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:56 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id y6so1449008pjc.4
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P7a3ovJfYqH7rlgS40CehEM91vUo6sSt21YTgxgCWwc=;
 b=soKK2RN48HrG7sZ0WLfHHYjtb14+pc2bJolqlwtJXoHCUNJDjcpAqI15I0dExCBJYV
 QHzIePW+DugeqhHezSK23zjTqjMMfv6B25c5wECrDTK0uVK+JPUH1sHJdnXl5IzAY9Af
 A1c0qGdMXG+c74O0WBAkPT2kNOAnD3nKYdwUkFue8WWt6KSVJnV8loWmkFAJAtsUco6y
 POLUD1bzTRQw9LcMlLEvteHAOCrZDgNRBIo7VFEIE85Qo+xFZYRmkiLO1jXowu60fYh/
 fGqI8Msjxqo12KBCyxMZhXXLGoWtSXcuhS4RoeueHpjdtcykmPeFUeeozcvcBvblHF/2
 V5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P7a3ovJfYqH7rlgS40CehEM91vUo6sSt21YTgxgCWwc=;
 b=ozIn6qzu5/C5LL6G4as23rv83ncEpA5uvcwHcHBXN4rJhGPAQ5d5Bt4O0EUYCxLbev
 aVWM5emVNWWnjgMADe+tJccsIfAgCBPjMAYkE4dp6Xe2bZ+rqKRkYanGmW3tr1pVx8NO
 JkjgCtYjxbITHTJBIpO193e5gA/pvoOrsBYH4nUYT9O3R2oof4CXHLwN/82127nFGqoy
 tn2N8cI4ZRZPu7ElwP/XBQ+mDvHx3z5GQg/cYeVNH+Ts+yoFv+7uXDlnM8pPh0Try3xv
 BdsTehs9MNECl1nI6IOVNG425QdDAQRjlGK1OKe067/jXRIyNa4WUFTrbVVhKBoG89En
 m22w==
X-Gm-Message-State: AGi0PualnE0+DylIfaOxlPN+eGuJ9t+KmaknIfWo3aXoi1/Lb91efGcq
 ybCNpJkHXCdwaOWiHKj5w7tBbA4Wb7E=
X-Google-Smtp-Source: APiQypIVm7wfWSJbO13qHxe0INpVjgr3A8Brs8j4wHhmvFcyOatnxPRDlbybYnLFul+c/kHQzbZYTw==
X-Received: by 2002:a17:902:b709:: with SMTP id
 d9mr29006584pls.118.1588093435186; 
 Tue, 28 Apr 2020 10:03:55 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:14 +0530
Message-Id: <20200428170228.7002-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:03:59 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 28 Apr 2020 19:03:57 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 18/32] parsing_cocci: disjdistr: Reflect Cast
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
disjdistr.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/disjdistr.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/disjdistr.ml b/parsing_cocci/disjdistr.ml
index 6724bb25..e171e6ea 100644
--- a/parsing_cocci/disjdistr.ml
+++ b/parsing_cocci/disjdistr.ml
@@ -219,9 +219,10 @@ and disjexp e =
   | Ast.RecordPtAccess(exp,ar,field) ->
       disjmult2 (disjexp exp) (disjident field)
 	(fun exp field -> Ast.rewrap e (Ast.RecordPtAccess(exp,ar,field)))
-  | Ast.Cast(lp,ty,rp,exp) ->
+  | Ast.Cast(lp,ty,attr,rp,exp) ->
       disjmult2 (disjty ty) (disjexp exp)
-	(function ty -> function exp -> Ast.rewrap e (Ast.Cast(lp,ty,rp,exp)))
+	(function ty -> function exp ->
+          Ast.rewrap e (Ast.Cast(lp,ty,attr,rp,exp)))
   | Ast.SizeOfExpr(szf,exp) ->
       let exp = disjexp exp in
       List.map (function exp -> Ast.rewrap e (Ast.SizeOfExpr(szf,exp))) exp
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
