Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C91E7CA9
	for <lists+cocci@lfdr.de>; Fri, 29 May 2020 14:09:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04TC8fLO025794;
	Fri, 29 May 2020 14:08:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6D3D2782B;
	Fri, 29 May 2020 14:08:41 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id ABA677783
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:08:39 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:443])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04TC8cOI023361
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:08:39 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id f3so1274735pfd.11
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 05:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wHY+Um2I5jR8VsFygeCDwrHqnWLvSLa9N71/pfYlc0s=;
 b=FeNoPCPGcLURp7tqFTeaigNU2k9/cXvHQLLtljwWCANBhvbxIK/4EcoJWGAeQkqwmO
 64gV7zR42tcOXGhI5Hf00QF64cG+o7xPN0sWKD7K8xZLFIEwC+PDBeg5L2TnwMWAX6lI
 ZhK5WVopcWXvN27RhESeW+4GW9BDaWsRXf4Gj208TPm7ssE63gwdsRAjC+pfQ2ct5MAg
 X/8ECbGvX3CyYUTNq4Fb4aMN7pQ41zooUMMAXr7eSBPtHKJmhWWFlCqwxoc7jcM9v8Qd
 SJRXsXaXnZ7zdBA9lpYIQee6ZgML1XOWmizIvgQV1iRQjHdSj70hDQk6HDEX01wDtZUG
 no9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wHY+Um2I5jR8VsFygeCDwrHqnWLvSLa9N71/pfYlc0s=;
 b=Bc6eASZOtc2GPOhgWN59T+vp+KrlGdNWQHZCOQTAN7+NFao2IaFqGJ9Bc2yNvHpOyZ
 q0YLichwClnGRJsVp5SH9tJi6qE04ppcDfBzWUuZSJUDJcoVwHvntL+Zhruuq234zayt
 odbyWDgCt9VtQALv0weUAttiz3f7KNwgfHnejB/8DdhKLPEq4aA+LpqLe0F5b71w5y6X
 B4RMaiCZhufX6mkoAvcpwS9JLyTR5ssVS/IxFrkQFFw0DehoXRHTfTKkQ7RBXpQNA+y3
 zHApQcbzduBOOTFNr832A5YgxnXaLhEiG18pmUujl6FSttptKiJaqc5G18PJwReSkZXh
 FcSQ==
X-Gm-Message-State: AOAM5308zBFyukCsLaihwVVMtCJjYFtdiDQ1ZYcQpwPBd4ILGP/XVwKr
 0kHyzgyjOIhQUKcdZ0QfJoy3zhwG
X-Google-Smtp-Source: ABdhPJx425IQcnf30kudw+rcMAniqlORlQ3NNYPk+E2yaccw52Gn+scK4QBQ27OBv4MQFM3kCjPhTA==
X-Received: by 2002:a63:4b41:: with SMTP id k1mr7751436pgl.452.1590754117264; 
 Fri, 29 May 2020 05:08:37 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:08:36 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:35 +0530
Message-Id: <20200529120703.31145-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 May 2020 14:08:41 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 29 May 2020 14:08:39 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 05/32] parsing_cocci: unparse_ast0: Reflect cast
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
unparse_ast0.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unparse_ast0.ml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
index 86b545b9..e735cb70 100644
--- a/parsing_cocci/unparse_ast0.ml
+++ b/parsing_cocci/unparse_ast0.ml
@@ -221,8 +221,10 @@ let rec expression e =
 	  expression exp; mcode print_string pt; ident field
       | Ast0.RecordPtAccess(exp,ar,field) ->
 	  expression exp; mcode print_string ar; ident field
-      | Ast0.Cast(lp,ty,rp,exp) ->
+      | Ast0.Cast(lp,ty,attr,rp,exp) ->
 	  mcode print_string_box lp; typeC ty; close_box();
+	  (if not (attr = []) then print_string " ");
+	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
 	  mcode print_string rp; expression exp
       | Ast0.SizeOfExpr(szf,exp) ->
 	  mcode print_string szf; expression exp
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
