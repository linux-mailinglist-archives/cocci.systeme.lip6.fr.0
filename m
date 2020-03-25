Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ACC1940E2
	for <lists+cocci@lfdr.de>; Thu, 26 Mar 2020 15:04:46 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02QE4Qrm023075;
	Thu, 26 Mar 2020 15:04:26 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BD1A477FC;
	Thu, 26 Mar 2020 15:04:26 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7C3AF66CB
 for <cocci@systeme.lip6.fr>; Wed, 25 Mar 2020 10:33:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02P9XHoG000231
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 25 Mar 2020 10:33:18 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C6CEAAFD;
 Wed, 25 Mar 2020 09:33:15 +0000 (UTC)
To: Kees Cook <keescook@chromium.org>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>
References: <20200323214618.28429-1-gpiccoli@canonical.com>
 <b73a6519-0529-e36f-fac5-e4b638ceb3cf@suse.cz>
 <eee335a2-e673-39bf-ae64-e49c66f74255@canonical.com>
 <202003241119.A666E1C694@keescook>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <9eab7f80-bad4-bcb1-7ec7-b6b90839b13a@suse.cz>
Date: Wed, 25 Mar 2020 10:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <202003241119.A666E1C694@keescook>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 26 Mar 2020 15:04:26 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 25 Mar 2020 10:33:18 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Thu, 26 Mar 2020 15:04:25 +0100
Cc: randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        penguin-kernel@I-love.SAKURA.ne.jp, linux-api@vger.kernel.org,
        kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr, linux-fsdevel@vger.kernel.org,
        tglx@linutronix.de, yzaikin@google.com, akpm@linux-foundation.org
Subject: Re: [Cocci] [PATCH V2] kernel/hung_task.c: Introduce sysctl to
 print all traces when a hung task is detected
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

On 3/24/20 7:20 PM, Kees Cook wrote:
> On Tue, Mar 24, 2020 at 09:45:40AM -0300, Guilherme G. Piccoli wrote:
>> Thanks Randy and Vlastimil for the comments. I really liked your
>> approach Vlastimil, I agree that we have no reason to not have a generic
>> sysctl setting via cmdline mechanism - I'll rework this patch removing
>> the kernel parameter (same for other patch I just submitted).
> 
> I've been thinking we'll likely want to have a big patch series that
> removes all the old "duplicate" boot params and adds some kind of
> "alias" mechanism.
> 
> Vlastimil, have you happened to keep a list of other "redundant" boot
> params you've noticed in the kernel? I bet there are a lot. :)

Well, I found about 4 that mentioned sysctl in
Documentation/admin-guide/kernel-parameters.txt
I suspect there will be more, but won't be trivial to identify them.


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
