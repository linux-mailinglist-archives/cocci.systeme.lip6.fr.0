Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DA28A6F9
	for <lists+cocci@lfdr.de>; Sun, 11 Oct 2020 12:27:39 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09BAR7FK004928;
	Sun, 11 Oct 2020 12:27:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E96B477BC;
	Sun, 11 Oct 2020 12:27:06 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 39810578C
 for <cocci@systeme.lip6.fr>; Sun, 11 Oct 2020 12:27:04 +0200 (CEST)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:52f])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09BAR3su017495
 for <cocci@systeme.lip6.fr>; Sun, 11 Oct 2020 12:27:03 +0200 (CEST)
Received: by mail-pg1-x52f.google.com with SMTP id l18so2147786pgg.0
 for <cocci@systeme.lip6.fr>; Sun, 11 Oct 2020 03:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=sZ4u0IYX+prhPTXd0MVIePeS5ONiOotzisA3LcVKmGs=;
 b=NVS7Zyk+rjxHS3Fim/isNHWuIprg+c2HM+wV+yaIh9E7EihNDRfTuLYfDV41xq9uwi
 uOy69v3QR0MakTzpXeOHvayM4QZM8Yo53iwXh6iUN0gxncfE5J6OfSrEU+NP09tRfsWy
 azWSanp94VlkodpfsZAnL9oSYSL4iL8BYLySvy9LD/FO9r1yLEeOgr3fC8nztbDP92LQ
 G9S08ezRghlNaq9pE2mf0ctDyLhd7f2fihyM5OedkNQJ752yk40uE/lSP9QBk7aUs0gX
 K6vACT9vq9wS/+UZL+nxX8nEPzVWqh1jqZZbpMgWLfScV0dWp03Lp2DZ7IN6lHis/pB/
 YY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=sZ4u0IYX+prhPTXd0MVIePeS5ONiOotzisA3LcVKmGs=;
 b=sqPi9v5TzELjKsVd7WGA0mQvkKEgoDX1fOpCZmjJABFnHRgVadVCk9ZeLW6KSgR0yb
 Fuwg6CqdAmGP7eM0YIOFnbEnXAVUZA5iONMQVH5eoLnkg0gNG9L0z+1PSCUrSt1JgNA+
 Mzk3C6OBG/sz/Ly5Rt/EBh+JC8suMqJUEUBiKK/fpRLgiAxv7v5ia9Zs1yydeqiNxqsx
 Xx/S7c15tTEvt9YLzfDLdxcE6GbQ3uwcZlt7/EMCD6XZ+xGIECIvQnleGbBj5Otr4lgo
 sjA0TmxVOTFp6xyqPDwh8shhhqbKo+WJtNimuiQpt2OReIWF9x0AitRgwhBsX5h0a+dn
 NmEQ==
X-Gm-Message-State: AOAM531h1ngo2qYAr3PIWKAKH6CjfQ3AEeLmcpDeeXDOluHf66ictewa
 Yg+snct3i1r1gV53Xflkzqk=
X-Google-Smtp-Source: ABdhPJxSlKHZz4nogWT9Nt3kZILi1+8lgygZc0KhYqgDj9p1Hb85VG4EdeKLcxVdM5B7uicpX/BFwA==
X-Received: by 2002:a17:90a:6301:: with SMTP id
 e1mr14656301pjj.131.1602412022680; 
 Sun, 11 Oct 2020 03:27:02 -0700 (PDT)
Received: from adolin ([49.207.215.73])
 by smtp.gmail.com with ESMTPSA id y4sm741762pgs.0.2020.10.11.03.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 03:27:02 -0700 (PDT)
Date: Sun, 11 Oct 2020 15:56:57 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: Julia.Lawall@lip6.fr
Message-ID: <cover.1602410019.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 11 Oct 2020 12:27:08 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 11 Oct 2020 12:27:03 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: michal.lkml@markovi.net, linux-doc@vger.kernel.org, Gilles.Muller@lip6.fr,
        corbet@lwn.net, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH v4 0/3] Improve Coccinelle Parallelisation
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

Presently, Coccinelle uses at most one thread per core to improve
performance in machines with more than 2 hyperthreads. Modify
coccicheck to use all available threads in machines upto 4 hyperthreads.
Further, modify the coccicheck script to improve portability.

Modify documentation to reflect the same. 

Sumera Priyadarsini (3):
  scripts: coccicheck: Add quotes to improve portability
  scripts: coccicheck: Change default condition for parallelism
  Documentation: Coccinelle: Modify Parallelisation information in docs

 Documentation/dev-tools/coccinelle.rst | 6 ++++--
 scripts/coccicheck                     | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
