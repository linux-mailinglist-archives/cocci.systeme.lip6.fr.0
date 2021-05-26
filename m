Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0536439157D
	for <lists+cocci@lfdr.de>; Wed, 26 May 2021 12:54:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 14QAs8Yc004806;
	Wed, 26 May 2021 12:54:08 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BAE2D77F8;
	Wed, 26 May 2021 12:54:08 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 049693E3B
 for <cocci@systeme.lip6.fr>; Wed, 26 May 2021 12:54:07 +0200 (CEST)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:102c])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 14QAs5VV028303
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 26 May 2021 12:54:06 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id q6so577038pjj.2
 for <cocci@systeme.lip6.fr>; Wed, 26 May 2021 03:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1FjNqsCrAlzXnaMemiO6HMZDYfhkuGkH+8sJBYkVGaE=;
 b=gZfP3fjP+/k7k33+N5WdoLBjbQuXsznwTbbSc42Kt3Xv/tps0PRrZ/+wqhIl7vdHlG
 Qjle3nH/ftySSKlOAL+ZnBY6f5QyASbC+CGtxl2OSB+W6bhRbWKBRAeUrPhOxQNScAHP
 tzl4naFSpD9woan68YDMwpcUJtqwD0JEGJuokJOzdx37eQ64bQhB8uejtS32S7HNi2lR
 i2aTimTFCGdlJso+KYcCu68d5c8aIxeR/CbSC0TG88DQKR8E+M/ksUyeOnsOyLyzf+Sl
 KvUbD+lgziWG6sss+n6PZtb+s6ugA18ltOix6PEJBbJPyqOaSdDZrwEAm3lslXMcfPel
 Ws5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1FjNqsCrAlzXnaMemiO6HMZDYfhkuGkH+8sJBYkVGaE=;
 b=LU9dwKLmc9SIUzSG6NArdlC1Un0Mklki3aj5QF52+efag5SJzQPtz2qbQ90vLeWLWu
 lSDw0YS0MtCTcwudD36+/8oFm/s1QkrB2pJnvGmacVkBcFTbZgpJelv5yGLEE9R0UFYw
 T3BVayB5sDDLn7u6Zfr/jg9cT7ITy2vfRdhKTwYkV3BvJN8ddhWi8LyKdwuKw6S0Tgl4
 e5IOppoXbGKjZ2rjy5BmBnCPSocYlKGsPW8vov8t0fYjlWqhTSsx883mQyNCAmfdJOUk
 GDvkHNULTTcbCsL+PyksDhRXnP+3sHVR5hYiS0I8c3qjlbSoKANe1tEZi1wPExuzheeP
 AMkQ==
X-Gm-Message-State: AOAM530IKI/+FXg2LgsqVBg8ojuSsdMBbDsEhm8XDMqVPHtbPffBen4i
 xToaTc3U4TxnJEHeGROPzJSMWPQt39XbpQ==
X-Google-Smtp-Source: ABdhPJz3JBLw2azvmbHwocDL8YJpdleWH4vdX5QtbG8Y2ml8SkWABlm92xkNdIOBQTQBoMhe8X1yDw==
X-Received: by 2002:a17:90a:9e5:: with SMTP id
 92mr36340113pjo.34.1622026444886; 
 Wed, 26 May 2021 03:54:04 -0700 (PDT)
Received: from adolin ([49.207.210.55])
 by smtp.gmail.com with ESMTPSA id l6sm2927857pjf.28.2021.05.26.03.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 03:54:04 -0700 (PDT)
Date: Wed, 26 May 2021 16:23:36 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: julia.lawall@inria.fr
Message-ID: <0f508494b059a90554ba2da6b030555dbbe3405b.1622024972.git.sylphrenadin@gmail.com>
References: <cover.1622024972.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1622024972.git.sylphrenadin@gmail.com>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 26 May 2021 12:54:08 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 26 May 2021 12:54:06 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH 2/2] docs: manual: Add option description in
 spatch_options
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

Add documentation for the "use-patchdiff" option introduced in
the first patch of this patchset. This option allows for
applying a semantic patch to only those files in a directory
where code additions have been made.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 docs/manual/spatch_options.tex | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/spatch_options.tex b/docs/manual/spatch_options.tex
index 223365bb5..afc55aa22 100644
--- a/docs/manual/spatch_options.tex
+++ b/docs/manual/spatch_options.tex
@@ -217,6 +217,11 @@ intereted relative to the target directory.  If the filename is an absolute
 path name, beginning with /, it is used as is.
 }
 
+\normal{-{}-use-patchdiff}{ This option allows for applying a semantic patch
+  to only the files that have been modified in a directory. The directory needs
+  to be specified by the user. Note that an absolute path needs to be used if
+  spatch is called from outside the target project directory. }
+
 \normal{-{}-use-coccigrep}{ Use a version of grep implemented in Coccinelle
   to check that selected files are relevant to the semantic patch.  This
   option is only relevant to the case of working on a complete directory,
-- 
2.31.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
