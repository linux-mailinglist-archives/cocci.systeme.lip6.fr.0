Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A81BC6EB
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:41:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SHfD3r010764;
	Tue, 28 Apr 2020 19:41:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B3F2D7807;
	Tue, 28 Apr 2020 19:41:13 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C2A377763
 for <cocci@systeme.lip6.fr>; Thu, 23 Apr 2020 19:02:53 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:443])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03NH2qU9004679
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 23 Apr 2020 19:02:53 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id 18so3248891pfx.6
 for <cocci@systeme.lip6.fr>; Thu, 23 Apr 2020 10:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BdjmbukyN93EyhI1DSTNcyhVrYjSoObY8SQv9ckT3OI=;
 b=vXhJEFPxCQwVoQXSTNO7YMg1HIyKEpV6lC+8pPWILrho1vIrTYf7UoAtU9MirtLHZe
 i6KIAsnQK7M9f/BFnt5/Y/yopgyslrJalNcovo0+uJBc1yu1OTt8V5/wn1qPIHDQKp82
 DVcB8mHqkVdvrwJ9AODqJAc4JXSSUGkpwH+pWtj1dj+qrhXUlF8RYRQXG4FYjWkyvDfa
 4UtchUVnEcSAc31X4mLxPHPY1uWi7U2ZcJpagDCh7QFHJiA6x0d3VS4QxxgxyTJ0w5os
 KAhYbfPZR82MsC+AF9VB7T+ByJwLrc+3wWRv4++vLdCNdV1CFjuGjDn375prp2Uw9Wp0
 m/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BdjmbukyN93EyhI1DSTNcyhVrYjSoObY8SQv9ckT3OI=;
 b=BcEOAah0eIUxjwd3iE0nXrtpwAXUVgocWEze06x2E3uFnY4Jf0sJQcsnDlykeaUWWQ
 Wt7P1B+FtvNNc7N5WFsBXwk/0dGSWsqTjyKILS5C9u1Znc5lPkbGApSgZiOs7ao4Grk9
 tf4LK06YW3zMV+y0kiXj7cEzCa+AbTjtHsFK2jVr6P9Kq4W2Z9r+Z/R710MWIeIqppGT
 fVFtup/fQFs8YrK5s1VmQINxBo4Crq+t91oR8QT2cUxyAUuykPvLKy/XqZS0itdvb3Rv
 Ud0vG9YeLhdGn28rxSCsgdJ6hnwAONerCv4hanFeQoVlyYXmQZYl23Q5WFWbhVVFZSG/
 il8A==
X-Gm-Message-State: AGi0PuYq1H37s1BQBeInVpj9jVtdofKEQa+m6AWHfB70orWx86HrjCGF
 vXZhl5youn15dG4d6SY/koc=
X-Google-Smtp-Source: APiQypJWSjA7CCiMuitdqpKx5L1KTkJAM/q32nofaJP3XA57AQ41nGcVcHpg1zkfSbrYj7gWzJBy1g==
X-Received: by 2002:a63:1d08:: with SMTP id d8mr4797010pgd.306.1587661371447; 
 Thu, 23 Apr 2020 10:02:51 -0700 (PDT)
Received: from localhost (176.122.158.71.16clouds.com. [176.122.158.71])
 by smtp.gmail.com with ESMTPSA id o198sm3105112pfg.183.2020.04.23.10.02.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 10:02:50 -0700 (PDT)
Date: Fri, 24 Apr 2020 01:02:45 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <20200423170245.GA3417@nuc8i5>
References: <c62ec54f-348b-2eae-59eb-374dde4d49ad@web.de>
 <20200423142909.GB1562@nuc8i5>
 <f054f00c-b813-e0c2-fe2e-30ccdec1ff46@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f054f00c-b813-e0c2-fe2e-30ccdec1ff46@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:41:14 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 23 Apr 2020 19:02:53 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Tue, 28 Apr 2020 19:41:11 +0200
Cc: linux-fbdev@vger.kernel.org,
        Thomas =?utf-8?Q?Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ralf =?utf-8?Q?B=C3=A4chle?= <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] console: Complete exception handling in newport_probe()
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

On Thu, Apr 23, 2020 at 05:23:29PM +0200, Markus Elfring wrote:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/scripts/coccinelle/free/iounmap.cocci
> >>
> >> How do you think about to extend presented software analysis approaches?
> >>
> > Sorry, I am not familiar with it, I don't know.
> 
> Do you find the comments helpful at the beginning of this SmPL script?
>
Sorry, I do not know how to use the SmPL script. 

> Would you like to let any more source code analysis tools help you
> to find remaining update candidates?
>
yes, but I think the source code analysis tools only can found the simple
repetitive issue. and need spend some time learning to use it. at different
stages, it should have different methods for me. now, I think the best for
me may be that read and check the source code. Thanks!

BR,
Dejin

> Regards,
> Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
