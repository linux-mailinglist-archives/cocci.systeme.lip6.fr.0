Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4F1E7CBB
	for <lists+cocci@lfdr.de>; Fri, 29 May 2020 14:10:26 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04TC9YLo009881;
	Fri, 29 May 2020 14:09:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 061A05D47;
	Fri, 29 May 2020 14:09:34 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2FB835D47
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:31 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:541])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04TC9TtN003687
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:30 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id d10so1409986pgn.4
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 05:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6kgMMvKew6AlYW9rnWT+Hm+2zMxidbbjrZ33P35PA7k=;
 b=r81HxqUFWsi1efmnfqSce3I52oXBdBiOwzsXnIHLl0DWYHeFPSDUq7uoiH70D5Zdp8
 c4hZBG0HiFI9iW4tGlFsmlzMgu8GlDUntoPjrIEd4zvIJ4TgTtEUa3H9q0SZuuD4giF1
 pvEGE7xiXvVTRDtJ41y19NeiNBIqnTkgGjEYw2TVNOk5r1l0oJ3LtFbJDvj3LuLm+Lth
 E2vR6YeoUYmzPwfCrPuDyqZN9zujIwY6iRwS/m14/sHMDNEdH0X+Ny0fCH++yButq/Cz
 0DHEjCQ73goi8vK8AhizKXlxWk6zZfE0wXnolka4yo+yt2VAaZeubSsdGIp7J/CQS/E1
 rWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kgMMvKew6AlYW9rnWT+Hm+2zMxidbbjrZ33P35PA7k=;
 b=Z76gzLjBvsTe7qY3l2DnZcCEOLkSJbIhdTwo7lV7S/4mF/FJoHROwhPGpG/J5yaANN
 0CK+v9SAXX4mRUMkkw3qhohobso6822afHQjxgcnQnuUMrBRL9JElASuQDGdFDehl2ag
 M003g5ioyc6AG/skjPMqbOXS9NcRX2DEmTXdyUNg8IhHVb6pHMBWJUV6xEtWtLi8TrCr
 IUfOrRijr4bP241Nyj0OCkkLzWWxzVzZD5+IDCxkgL3hi/CSm7P9gys8LnRyEc13CpHd
 BtbaI2sFR5WyprlYlR7B0kgRNfNl93J6/yRpXx2iN8EslcxE3Io4fR46YXHLfqz2eAc3
 JXBw==
X-Gm-Message-State: AOAM530CFEAEn3s22hL9Dbf315mKzf8eDpkJDGZmtFxgjVApvBWVq3cy
 9VIynrvkQiGa4Qxr/A45JMETYzMu
X-Google-Smtp-Source: ABdhPJw9hdyh/hsmVC4iRCQddp9M46+HZw3K1IAX45wXs14HOugW0ykGxlYnd41FcXtIREVihjoNXw==
X-Received: by 2002:a63:fd57:: with SMTP id m23mr8479736pgj.325.1590754168688; 
 Fri, 29 May 2020 05:09:28 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:28 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:47 +0530
Message-Id: <20200529120703.31145-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 May 2020 14:09:34 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 29 May 2020 14:09:30 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 17/32] parsing_cocci: ast0toast: Reflect Cast
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
ast0toast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0toast.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/ast0toast.ml b/parsing_cocci/ast0toast.ml
index 80d38138..856836cd 100644
--- a/parsing_cocci/ast0toast.ml
+++ b/parsing_cocci/ast0toast.ml
@@ -439,9 +439,10 @@ and expression e =
 	Ast.RecordAccess(expression exp,mcode pt,ident field)
     | Ast0.RecordPtAccess(exp,ar,field) ->
 	Ast.RecordPtAccess(expression exp,mcode ar,ident field)
-    | Ast0.Cast(lp,ty,rp,exp) ->
+    | Ast0.Cast(lp,ty,attr,rp,exp) ->
 	let allminus = check_allminus.VT0.combiner_rec_expression e in
-	Ast.Cast(mcode lp,typeC allminus ty,mcode rp,expression exp)
+	let attr = List.map mcode attr in
+	Ast.Cast(mcode lp,typeC allminus ty,attr,mcode rp,expression exp)
     | Ast0.SizeOfExpr(szf,exp) ->
 	Ast.SizeOfExpr(mcode szf,expression exp)
     | Ast0.SizeOfType(szf,lp,ty,rp) ->
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
