Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C761B61FD
	for <lists+cocci@lfdr.de>; Thu, 23 Apr 2020 19:32:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03NHWXe1022920;
	Thu, 23 Apr 2020 19:32:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 07E73782E;
	Thu, 23 Apr 2020 19:32:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4BC127763
 for <cocci@systeme.lip6.fr>; Thu, 23 Apr 2020 19:32:31 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03NHWTjL007415
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Thu, 23 Apr 2020 19:32:30 +0200 (CEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A77520736;
 Thu, 23 Apr 2020 17:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587663148;
 bh=w7GOTzU61w5iz2sI2oB4nl36pNz0/hQHD6NjHrABKvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aSvY0ir9c0SUohXTKU7lIoUdA78xgQ1DWN/047qt8+5lPcvrX0Jj2Ve7lY20CQ+vW
 g7xI0a6sc4ouVkqww9/DTv0z1SWdC1muAW45goUiUkj8Xi2HNlvMGY4cCV0XtDoOpg
 Lc0ZVGD0H/uosKy/yWr8AiwduhdHcMWjdNuo0xcU=
Date: Thu, 23 Apr 2020 19:32:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dejin Zheng <zhengdejin5@gmail.com>
Message-ID: <20200423173226.GA75304@kroah.com>
References: <c62ec54f-348b-2eae-59eb-374dde4d49ad@web.de>
 <20200423142909.GB1562@nuc8i5>
 <f054f00c-b813-e0c2-fe2e-30ccdec1ff46@web.de>
 <20200423170245.GA3417@nuc8i5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423170245.GA3417@nuc8i5>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 23 Apr 2020 19:32:33 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 23 Apr 2020 19:32:30 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-fbdev@vger.kernel.org,
        Thomas =?iso-8859-1?Q?Bogend=F6rfer?= <tsbogend@alpha.franken.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        Ralf =?iso-8859-1?Q?B=E4chle?= <ralf@linux-mips.org>,
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

On Fri, Apr 24, 2020 at 01:02:45AM +0800, Dejin Zheng wrote:
> On Thu, Apr 23, 2020 at 05:23:29PM +0200, Markus Elfring wrote:
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/scripts/coccinelle/free/iounmap.cocci
> > >>
> > >> How do you think about to extend presented software analysis approaches?
> > >>
> > > Sorry, I am not familiar with it, I don't know.
> > 
> > Do you find the comments helpful at the beginning of this SmPL script?
> >
> Sorry, I do not know how to use the SmPL script. 

<snip>

Please note you are responding to someone who many kernel maintainers,
myself included, have on their blacklist as they are totally unhelpful.
Please feel free to ignore them like the rest of us do.

greg k-h
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
