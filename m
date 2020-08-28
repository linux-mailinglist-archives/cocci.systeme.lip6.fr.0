Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86525564F
	for <lists+cocci@lfdr.de>; Fri, 28 Aug 2020 10:22:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07S8MYp4004155;
	Fri, 28 Aug 2020 10:22:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 77D8477BF;
	Fri, 28 Aug 2020 10:22:34 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DF79A4316
 for <cocci@systeme.lip6.fr>; Fri, 28 Aug 2020 10:22:31 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0139.hostedemail.com
 [216.40.44.139])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07S8MQ7w000381
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Fri, 28 Aug 2020 10:22:27 +0200 (CEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 358A4180154A4;
 Fri, 28 Aug 2020 08:22:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2911:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3872:3874:4250:4321:4425:5007:8531:10004:10400:10848:11232:11658:11914:12295:12296:12297:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21324:21433:21627:21990:30054:30056:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: head10_2f0dd8327074
X-Filterd-Recvd-Size: 3029
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Fri, 28 Aug 2020 08:22:24 +0000 (UTC)
Message-ID: <a98b0a411abdaf6b58c73322511087f57353fb22.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Kees Cook <keescook@chromium.org>
Date: Fri, 28 Aug 2020 01:22:23 -0700
In-Reply-To: <526af204ddf95f94012c6132d12693852bfe7442.camel@perches.com>
References: <20200827071537.GA168593@kroah.com>
 <20200827131819.7rcl2f5js3hkoqj2@lenovo-laptop>
 <def24e9e-018c-9712-0d07-d4cbc84f07d9@rasmusvillemoes.dk>
 <20200827144846.yauuttjaqtxaldxg@lenovo-laptop>
 <5d1dfb9b031130d4d20763ec621233a19d6a88a2.camel@perches.com>
 <alpine.DEB.2.22.394.2008272141220.2482@hadrien>
 <5853c58e-7d26-2cf9-6cbf-698ecd93cbf9@linux.com>
 <202008271517.ECC1F1F8F@keescook>
 <5ebe5c2737b59d04f1b8a46008cd3159c638f9d0.camel@perches.com>
 <d99c613aa70617f440c51d9413372b858a4ae826.camel@perches.com>
 <202008280056.6442BCC@keescook>
 <526af204ddf95f94012c6132d12693852bfe7442.camel@perches.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 28 Aug 2020 10:22:35 +0200 (CEST)
X-Greylist: Delayed for 11:52:42 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Fri, 28 Aug 2020 10:22:27 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org, Alex Dewar <alex.dewar90@gmail.com>,
        cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] usb: atm: don't use snprintf() for sysfs attrs
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

On Fri, 2020-08-28 at 01:10 -0700, Joe Perches wrote:
> On Fri, 2020-08-28 at 00:58 -0700, Kees Cook wrote:
> > On Thu, Aug 27, 2020 at 09:12:06PM -0700, Joe Perches wrote:
> > > Perhaps something like the below with a sample conversion
> > > that uses single and multiple sysfs_emit uses.
> > 
> > On quick review, I like it. :)
> > 
> > > [...]
> > > +int sysfs_emit(char *buf, char *pos, const char *fmt, ...)
> > > +{
> > > +	int len;
> > > +	va_list args;
> > > +
> > > +	WARN(pos < buf, "pos < buf\n");
> > > +	WARN(pos - buf >= PAGE_SIZE, "pos >= PAGE_SIZE (%tu > %lu)\n",
> > > +	     pos - buf, PAGE_SIZE);
> > > +	if (pos < buf || pos - buf >= PAGE_SIZE)
> > > +		return 0;
> > 
> > This can be:
> > 
> > 	if (WARN(pos < buf, "pos < buf\n") ||
> > 	    WARN(pos - buf >= PAGE_SIZE, "pos >= PAGE_SIZE (%tu > %lu)\n",
> > 		 pos - buf, PAGE_SIZE))
> > 		return 0;
> 
> I have some vague recollection that WARN could be compiled
> away to nothing somehow.  True or false?
> 
> If false, sure, of course, it'd be faster too.

I can't find an instance where WARN doesn't return the
condition.

And likely even faster would be to just show "invalid pos"
instead of specific messages.

	if (WARN(pos < buf || (pos - buf) >= PAGE_SIZE,
		 "Invalid pos\n");
		return 0;

or maybe use WARN_ONCE or no WARN at all.

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
